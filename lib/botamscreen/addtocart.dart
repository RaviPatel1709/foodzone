import 'package:flutter/material.dart';
import 'package:loginappnew/upi23.dart';
import '../botambar.dart';

class CartItem {
  final Map<String, dynamic> product;
  int quantity;
  String totalPrice;

  CartItem({
    required this.product,
    required this.quantity,
    required this.totalPrice,
  });

  void updateQuantity(int newQuantity) {
    quantity = newQuantity;
    totalPrice = (newQuantity * (product['price'] as num)).toStringAsFixed(2);
  }
}

class CartManager {
  static final CartManager _instance = CartManager._internal();

  CartManager._internal();

  factory CartManager() => _instance;

  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem item) {
    final existingIndex = _cartItems.indexWhere(
          (cartItem) => cartItem.product["name"] == item.product["name"],
    );

    if (existingIndex != -1) {
      _cartItems[existingIndex] = item;
    } else {
      _cartItems.add(item);
    }
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
  }

  void updateItemQuantity(int index, int newQuantity) {
    if (newQuantity > 0) {
      _cartItems[index].updateQuantity(newQuantity);
    } else {
      // removeItem(index);
      removeItem(index);
    }
  }

  double get totalCartPrice {
    return _cartItems.fold(0.0, (sum, item) {
      double itemPrice;
      try {
        // Parse the price as a double if it's a string
        itemPrice = item.product['price'] is String
            ? double.parse(
            (item.product['price'] as String).replaceAll(RegExp(r'[^\d.]'), ''))
            : item.product['price'] as double;
      } catch (e) {
        itemPrice = 0.0; // Fallback in case of invalid data
      }
      return sum + (item.quantity * itemPrice);
    });
  }

}

class AddToCartScreen extends StatefulWidget {
  @override
  _AddToCartScreenState createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {

  final CartManager cartManager = CartManager();
  List<bool> isLoading = [];

  @override
  void initState() {
    super.initState();
    _initializeLoadingState();
  }

  void _initializeLoadingState() {
    isLoading = List<bool>.filled(cartManager.cartItems.length, false);
  }

  Future<void> _updateQuantity(int index, int newQuantity) async {
    setState(() {
      isLoading[index] = true; // Start loader for this item
    });

    try {
      await Future.delayed(Duration(milliseconds: 5)); // Simulate delay
      setState(() {
        cartManager.updateItemQuantity(index, newQuantity);
      });
    } finally {
      // Stop loader irrespective of success or failure
      setState(() {
        isLoading[index] = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        backgroundColor: Colors.blue,
        // leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        color: Colors.blueGrey.shade50, // Set the background color of the body content
        padding: EdgeInsets.all(16.0),
        child: cartManager.cartItems.isEmpty
            ? Center(
          child: Text(
            "Your cart is empty!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        )
            : ListView.builder(
          itemCount: cartManager.cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cartManager.cartItems[index];

            double price = 0.0;
            try {
              price = double.parse(
                  cartItem.product['price'].replaceAll("₹", "").trim());
            } catch (e) {
              price = 0.0;
            }
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.blue.withOpacity(0.2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue.withOpacity(0.3), width: 1),
              ),
              child: ListTile(
                leading: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      backgroundColor: Colors.white,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Handle for bottom sheet
                              Center(
                                child: Container(
                                  width: 60,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),

                              // Product Image
                              if (cartItem.product["image"] != null)
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      cartItem.product["image"],
                                      width: 180,
                                      height: 180,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(
                                          Icons.image_not_supported,
                                          size: 180,
                                          color: Colors.grey[400],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              SizedBox(height: 20),

                              // Product Name
                              Center(
                                child: Text(
                                  cartItem.product["name"],
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                    letterSpacing: 1.2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 16),

                              // Divider
                              Divider(
                                color: Colors.blueAccent.withOpacity(0.3),
                                thickness: 1.5,
                              ),
                              SizedBox(height: 16),

                              // Price Row
                              Row(
                                children: [
                                  Icon(Icons.attach_money, color: Colors.greenAccent, size: 28),
                                  SizedBox(width: 8),
                                  Text(
                                    "Price:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${cartItem.product['price']}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),

                              // Quantity Row
                              Row(
                                children: [
                                  Icon(Icons.production_quantity_limits, color: Colors.orangeAccent, size: 28),
                                  SizedBox(width: 8),
                                  Text(
                                    "Quantity:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${cartItem.quantity}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),

                              // Total Price Row
                              Row(
                                children: [
                                  Icon(Icons.money_off, color: Colors.redAccent, size: 28),
                                  SizedBox(width: 8),
                                  Text(
                                    "Total Price:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "₹${(price * cartItem.quantity).toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: cartItem.product["image"] != null
                        ? Image.asset(
                      cartItem.product["image"],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.image_not_supported,
                          size: 60,
                          color: Colors.grey[400],
                        );
                      },
                    )
                        : Icon(Icons.image_not_supported, size: 60, color: Colors.grey[400]),
                  ),
                ),
                subtitle:Row(
                  children: [
                    // Product Details
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4),
                          Text(
                            cartItem.product["name"],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Price: ${cartItem.product['price']}",
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          SizedBox(height: 4),
                          Text(
                            cartItem.product["discount"],
                            style: TextStyle(
                              fontSize: 12, // Font size
                              fontWeight: FontWeight.bold, // Bold text
                              color: Colors.red.shade700, // Text color to match the background
                              letterSpacing: 1.0, // Adds some spacing between letters
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.redAccent),
                            onPressed: !isLoading[index]
                                ? () {
                              _updateQuantity(index, cartItem.quantity - 1);
                            }
                                : null,
                          ),
                          Expanded(
                            child: Container(

                              child: Text(
                                "${cartItem.quantity}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.green),
                            onPressed: !isLoading[index]
                                ? () {
                              _updateQuantity(index, cartItem.quantity + 1);
                            }
                                : null,
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "₹${(cartItem.quantity * price).toStringAsFixed(2)}",  // Calculate total price here
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),


                  ],
                ),

              ),
            );

          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 80.0,  // Adjust height for better visual balance
        child: Row(
          children: [
            const SizedBox(width: 9,),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => botambar(), // Replace with your Home Screen widget
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 11.0),  // Padding for the button
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.lightGreen], // Smooth green gradient
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12),  // Rounded corners for button
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: Offset(0, 4),  // Shadow effect for the home button
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 9,),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: cartManager.totalCartPrice == 0.0
                    ? null  // Disable the onTap when amount is 0.0
                    : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UPIPaymentScreen(
                        amount: cartManager.totalCartPrice.toStringAsFixed(2),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),  // Better padding for click area
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepOrange, Colors.orange], // Gradient from deep orange to light orange
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12), // Rounded button corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.5),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: Offset(0, 4), // Shadow for the payment button
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.payment,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Pay ₹${cartManager.totalCartPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 9,),
          ],
        ),
      ),
    );
  }
}
