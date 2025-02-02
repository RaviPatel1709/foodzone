import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'detailscreen2.dart';

class SaveScreen extends StatefulWidget {
  @override
  _SaveScreenState createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  List<Map<String, dynamic>> homepageSavedProducts = [];
  List<Map<String, dynamic>> productGridSavedProducts = [];
  List<Map<String, dynamic>> allSavedProducts = [];

  @override
  void initState() {
    super.initState();
    _loadSavedProducts();
  }

  // Load saved products from SharedPreferences
  Future<void> _loadSavedProducts() async {
    final prefs = await SharedPreferences.getInstance();

    // Load homepage saved products
    final homepageFavorites = prefs.getString('homepage_favorite_products');
    if (homepageFavorites != null) {
      homepageSavedProducts = List<Map<String, dynamic>>.from(jsonDecode(homepageFavorites));
    }

    // Load product grid saved products
    final productGridFavorites = prefs.getString('productgrid_favorite_products');
    if (productGridFavorites != null) {
      productGridSavedProducts = List<Map<String, dynamic>>.from(jsonDecode(productGridFavorites));
    }

    // Merge both lists into allSavedProducts with a source field
    setState(() {
      allSavedProducts = [
        ...homepageSavedProducts.map((product) => {...product, "source": "homepage"}),
        ...productGridSavedProducts.map((product) => {...product, "source": "productGrid"}),
      ];
    });
  }

  // Remove a specific product from saved lists and SharedPreferences
  Future<void> _unlikeProduct(Map<String, dynamic> product) async {
    final prefs = await SharedPreferences.getInstance();

    // Remove the product from the respective list based on its source
    if (product["source"] == "homepage") {
      homepageSavedProducts.removeWhere((p) => p["name"] == product["name"]);
      prefs.setString('homepage_favorite_products', jsonEncode(homepageSavedProducts));
    } else if (product["source"] == "productGrid") {
      productGridSavedProducts.removeWhere((p) => p["name"] == product["name"]);
      prefs.setString('productgrid_favorite_products', jsonEncode(productGridSavedProducts));
    }

    // Update allSavedProducts to reflect the change
    setState(() {
      allSavedProducts = [
        ...homepageSavedProducts.map((product) => {...product, "source": "homepage"}),
        ...productGridSavedProducts.map((product) => {...product, "source": "productGrid"}),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Saved Products'),
        backgroundColor: Colors.green,
      ),
      body: allSavedProducts.isEmpty
          ? Center(child: Text('No saved products found.'))
          : ListView.builder(
        itemCount: allSavedProducts.length,
        itemBuilder: (context, index) {
          final product = allSavedProducts[index];
          return GestureDetector(
            onTap: () {
              // Add any action you want to take when the button is tapped.
            },
            child: ElevatedButton( // Wrap the Card widget inside an ElevatedButton
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen2(product: product), // Pass product to DetailScreen2
                    ),
                  );
                },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0), // Remove padding so the card is fully visible
              ),
              child: Card(
                child: ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading: Container(
                    width: 60,  // Adjust the width as needed
                    height: 60, // Adjust the height as needed
                    child: Image.asset(
                      product["image"],
                      fit: BoxFit.cover, // This makes the image fit within the container
                    ),
                  ),
                  title: Text(product["name"]),
                  subtitle: Text(product["price"]),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite, color: Colors.red),
                    onPressed: () => _unlikeProduct(product), // Unlike specific product
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
