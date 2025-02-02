import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loginappnew/webscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<Map<String, dynamic>> allItems = [
    {
      "name": "Product 1",
      "price": "₹99",
      "image": "images/img_7.png",
      "discount": "20% off",
      "isLiked": false
    },
    {
      "name": "Pizza",
      "price": "₹500",
      "image": "images/img_8.png",
      "discount": "10% off",
      "isLiked": false
    },
    {
      "name": "Pizza 2",
      "price": "₹1200",
      "image": "images/img_9.png",
      "discount": "20% off",
      "isLiked": false
    },
    {
      "name": "Product 4",
      "price": "₹500",
      "image": "images/img_10.png",
      "discount": "10% off",
      "isLiked": false
    },
    {
      "name": "Product 5",
      "price": "₹500",
      "image": "images/img_10.png",
      "discount": "10% off",
      "isLiked": false
    },
    {"name": "cloth1", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "cloth2", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "drinks1", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "date1", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "date2", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "burger", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
  ];

  List<Map<String, dynamic>> filteredItems = [];
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    filteredItems = []; // Start with an empty list until search is performed

    // Listen to search input
    searchController.addListener(() {
      filterSearchResults(searchController.text);
    });
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredItems = []; // If no search query, show no items
      });
    } else {
      setState(() {
        filteredItems = allItems
            .where((item) => item['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: searchController.text.isNotEmpty || searchFocusNode.hasFocus
                          ? Colors.black87
                          : Colors.black,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        focusNode: searchFocusNode,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.black87),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ),
                    if (searchController.text.isNotEmpty || searchFocusNode.hasFocus)
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          filterSearchResults('');
                        },
                        color: Colors.black87,
                      ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Colors.deepOrangeAccent,
          toolbarHeight: 90,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: filteredItems.isEmpty
                    ? Center(
                  child: Text(
                    searchController.text.isEmpty
                        ? 'Start typing to search...'
                        : 'No products found',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                )
                    : ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        title: Text(
                          item['name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueAccent,
                          ),
                        ),
                        leading: Image.asset(
                          item['image'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blueAccent,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemDetailScreen(
                                product: item,
                                allItems: allItems,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  final List<Map<String, dynamic>> allItems;

  ItemDetailScreen({required this.product, required this.allItems});

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getString('homepage_favorite_products');

    if (savedFavorites != null) {
      final List<Map<String, dynamic>> favoriteProducts =
      List<Map<String, dynamic>>.from(jsonDecode(savedFavorites));

      for (var product in widget.allItems) {
        product["isLiked"] =
            favoriteProducts.any((fav) => fav["name"] == product["name"]);
      }

      setState(() {});
    }
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteProducts = [
      ...widget.allItems.where((product) => product["isLiked"]),
    ];

    prefs.setString('homepage_favorite_products', jsonEncode(favoriteProducts));
  }

  void _toggleFavorite(Map<String, dynamic> product) {
    setState(() {
      product["isLiked"] = !product["isLiked"];
    });
    _saveFavorites();
  }

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  @override
  Widget build(BuildContext context) {

    String productName = widget.product['name'].toLowerCase();

    List<String> categories = ['pizza', 'product', 'cloth', 'drink', 'burger', 'date'];
    String category = categories.firstWhere(
          (category) => productName.contains(category),
      orElse: () => '',
    );

    List<Map<String, dynamic>> similarProducts = category.isNotEmpty
        ? widget.allItems.where((product) => product['name'].toLowerCase().contains(category)).toList()
        : widget.allItems.where((product) => product['name'].toLowerCase().contains(productName)).toList();

    similarProducts = [
      widget.product,
      ...similarProducts.where((item) => item != widget.product),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          shrinkWrap: true, // Ensures that the vertical ListView uses only the space it needs
          physics: const BouncingScrollPhysics(),
          itemCount: similarProducts.length,

          itemBuilder: (context, index) {
            final product = similarProducts[index];
            return Material(
              color: Colors.transparent,
              child: SizedBox(
                height: 150,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          product: product,
                          onFavoriteChanged: (updatedProduct) {
                            setState(() {
                              product["isLiked"] = updatedProduct["isLiked"];
                            });
                            _saveFavorites();
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 199,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Product image with favorite icon
                        Container(
                          height: 199,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white70,
                                Colors.deepOrangeAccent.shade200,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.pink.shade100.withOpacity(0.6),
                                offset: const Offset(4, 4),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  product["image"],
                                  height: 190,
                                  width: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: Icon(
                                    product["isLiked"]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: product["isLiked"] ? Colors.red : Colors.white,
                                    size: 25,
                                  ),
                                  onPressed: () => _toggleFavorite(product),
                                  iconSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 17), // Add spacing between image and text
                        // Product details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                product["name"],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  letterSpacing: 0.5,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product["price"],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product["discount"],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              indent: 15,
              endIndent: 15,
            );
          },
        ),
      )

    );
  }
}
