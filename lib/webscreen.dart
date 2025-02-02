import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'botamscreen/addtocart.dart';

class DetailScreen extends StatefulWidget {

  final Map<String, dynamic> product;
  final Function(Map<String, dynamic>) onFavoriteChanged;
  DetailScreen({required this.product, required this.onFavoriteChanged});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool isLiked;
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    isLiked = widget.product["isLiked"] ?? false;
    _initDeepLink();
  }

  // Generate dynamic deep link for sharing
  String generateProductLink(Map<String, dynamic> product) {
    String productName = Uri.encodeComponent(product["name"]);
    String productPrice = Uri.encodeComponent(product["price"]);
    String productDiscount = Uri.encodeComponent(product["discount"] ?? "");

    return "yourapp://product?name=$productName&price=$productPrice&discount=$productDiscount";
  }

  // Handle sharing product with a clickable deep link
  void _shareProduct() async {
    // Generate the deep link dynamically using the current product
    String productLink = generateProductLink(widget.product);

    // Construct the text content for sharing
    String content = '${widget.product["name"]}\n'
        '${widget.product["price"]}\n'
        '${widget.product["discount"]}\n\n'
        'Check out this amazing product!\n\n'
        'Link: $productLink'; // Adding the actual URL link directly

    // Share the product link along with details
    if (!kIsWeb) {
      // If not on web, share product image and link
      String imagePath = widget.product["image"];
      final byteData = await rootBundle.load(imagePath);
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/product_image.png');
      await file.writeAsBytes(byteData.buffer.asUint8List());

      // Share with the link as part of the text
      await Share.shareFiles([file.path], text: content);
    } else {
      // For web, just share the text content with the clickable link
      await Share.share(content);
    }
  }

  // Listen for deep link and navigate accordingly
  void _initDeepLink() async {
    _sub = linkStream.listen((String? link) async {
      if (link != null) {
        Uri uri = Uri.parse(link);
        if (uri.scheme == "yourapp" && uri.host == "product") {
          String productName = uri.queryParameters["name"] ?? "";
          String productPrice = uri.queryParameters["price"] ?? "";
          String productDiscount = uri.queryParameters["discount"] ?? "";

          if (productName.isNotEmpty &&
              productPrice.isNotEmpty &&
              productDiscount.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  product: {
                    "name": productName,
                    "price": productPrice,
                    "discount": productDiscount,
                  },
                  onFavoriteChanged: (product) {},
                ),
              ),
            );
          }
        }
      }
    });
  }

  // Toggle favorite state
  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    widget.product["isLiked"] = isLiked;
    widget.onFavoriteChanged(widget.product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isLiked ? "Added to favorites!" : "Removed from favorites!",
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }

  // Dispose the listener when the screen is disposed
  @override
  void dispose() {
    super.dispose();
    _sub?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          widget.product["name"],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.green,
        elevation: 5,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _shareProduct,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image Section
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.orangeAccent,
                        Colors.white
                      ], // Green to white gradient
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Image.asset(
                          widget.product["image"],
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 15,
                          right: 15,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              "Hot Deal",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Product Title and Favorite Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product["name"],
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          blurRadius: 2,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 30, // Slightly larger icon
                    ),
                    onPressed: _toggleLike,
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Price and Discount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.product["price"]}", // Assuming price is a number
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                      shadows: [
                        Shadow(
                          color: Colors.green.withOpacity(0.3),
                          blurRadius: 4,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                  if (widget.product["discount"] != null)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.3),
                            blurRadius: 6,
                            offset: Offset(1, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        widget.product["discount"],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              int quantity = 1;

              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      // Parse the product price to a double
                      double price = 0.0;
                      try {
                        price = double.parse(
                            widget.product["price"].replaceAll("₹", "").trim());
                      } catch (e) {
                        price = 0.0;
                      }

                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header Section
                            Row(
                              children: [
                                Icon(Icons.shopping_bag_outlined,
                                    size: 28, color: Colors.green),
                                SizedBox(width: 10),
                                Text(
                                  "Confirm Purchase",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green.shade700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Quantity:",
                                    style: TextStyle(fontSize: 18)),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          if (quantity > 1) {
                                            setState(() {
                                              quantity--;
                                            });
                                          }
                                        },
                                        icon: Icon(Icons.remove,
                                            color: Colors.red, size: 26),
                                      ),
                                      Text(
                                        "$quantity",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                        icon: Icon(Icons.add,
                                            color: Colors.green, size: 26),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Price:",
                                    style: TextStyle(fontSize: 18)),
                                Text(
                                  "₹${(price * quantity).toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green.shade700,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                                thickness: 1,
                                height: 30,
                                color: Colors.grey.shade300),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddToCartScreen(),
                                      ),
                                    );

                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange, // Different color for "View Cart"
                                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  icon: Icon(Icons.shopping_cart_checkout, color: Colors.white),
                                  label: Text(
                                    "VIEW CART",
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    final cartManager = CartManager();
                                    cartManager.addItem(
                                      CartItem(
                                        product: widget.product,
                                        quantity: quantity,
                                        totalPrice: (price * quantity).toStringAsFixed(2),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                                  label: Text(
                                    "ADD TO CART",
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                )

                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
            icon: Icon(Icons.shopping_cart, color: Colors.white, size: 24),
            label: Text(
              "Buy Now",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade600,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }
}
