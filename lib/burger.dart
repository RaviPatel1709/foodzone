import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loginappnew/webscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductListScreen extends StatefulWidget {
  final List<Map<String, dynamic>> products; // Accept list of products

  const ProductListScreen({super.key, required this.products});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  // Load favorite products from SharedPreferences
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getString('productgrid_favorite_products');
    if (savedFavorites != null) {
      final List<Map<String, dynamic>> favoriteProducts = List<Map<String, dynamic>>.from(jsonDecode(savedFavorites));
      for (var product in widget.products) {
        product["isLiked"] = favoriteProducts.any((fav) => fav["name"] == product["name"]);
      }
      setState(() {});
    }
  }

  // Save liked products to SharedPreferences
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteProducts = widget.products.where((product) => product["isLiked"] == true).toList(); // Filter liked products
    prefs.setString('productgrid_favorite_products', jsonEncode(favoriteProducts));
  }

  // Toggle the like status of a product
  void _toggleFavorite(Map<String, dynamic> product) {
    setState(() {
      product["isLiked"] = !product["isLiked"];
    });
    _saveFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List")),
      body: widget.products.isEmpty
          ? Center(child: Text("No Products Available"))
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.products.length,
          itemExtent: 150, // Adjust the height of each item
          itemBuilder: (context, index) {
            final product = widget.products[index];
            return Material(
              color: Colors.transparent,
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
                              Colors.pinkAccent.shade100,
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
                                  product["isLiked"] ? Icons.favorite : Icons.favorite_border,
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
            );
          },
        ),
      ),
    );
  }

}