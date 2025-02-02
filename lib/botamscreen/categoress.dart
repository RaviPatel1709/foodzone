import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loginappnew/webscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../new save.dart';
import '../search screen.dart';

class categoress extends StatefulWidget {
  @override
  _categoressState createState() => _categoressState();
}

class _categoressState extends State<categoress> {

  final int itemsPerRow = 3; // Number of grid items per row
  final int totalItems = 134; // Total grid items
  final ScrollController _scrollController = ScrollController();
  final ScrollController _buttonScrollController = ScrollController();
  double rowHeight = 125.0; // Height of each grid row
  double titleHeight = 75.0; // Height of each title
  int selectedIndex = 0; // Default selected index is 0 (first button selected)

  List<Map<String, dynamic>> expolore1 = [
    {"name": "Fiction", "image": "images/img_6.png"},
    {"name": "Non-Fiction", "image": "images/img_8.png"},
    {"name": "Science",  "image": "images/img_9.png"},
    {"name": "Technology",  "image": "images/img_10.png"},
    {"name": "History",  "image": "images/img_12.jpg"},
    {"name": "Biography",  "image": "images/img_10.png"},
    {"name": "Art & Design",  "image": "images/img_11.png"},
    {"name": "Travel", "image": "images/img11.jpg"},
    {"name": "Mystery", "image": "images/img_6.png"},
    {"name": "Fantasy", "image": "images/img_8.png"},
    {"name": "Horror",  "image": "images/img_9.png"},
    {"name": "Adventure",  "image": "images/img_10.png"},
    {"name": "Fantasy",  "image": "images/img_12.jpg"},
    {"name": "Horr",  "image": "images/img_10.png"},
    {"name": "Adventure",  "image": "images/img_11.png"},
  ];

  List<Map<String, dynamic>> expolore2 = [
    {"name": "Product 1", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 2", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 3", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product 4", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 5", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 6", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 7", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 8", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 9", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 10", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 11", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 12", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product 13", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 14", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 15", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 16", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 17", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 18", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 19", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 20", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 21", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product 22", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 23", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 24", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 25", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 26", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 27", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 28", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 29", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 30", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product 31", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 32", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 33", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 34", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 35", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 36", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 37", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 38", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 39", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product 40", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 41", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 42", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 43", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 44", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 45", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 46", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 47", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 48", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product 49", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 50", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 51", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 52", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 53", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 54", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 55", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 56", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 57", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product 58", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 59", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 60", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 61", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 62", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 63", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 64", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 65", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 66", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product 67", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 68", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 69", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 70", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 71", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 72", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 73", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 74", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 75", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product 76", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 77", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 78", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 79", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 80", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 81", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 82", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 83", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 84", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product 85", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 86", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 87", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 88", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 89", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 90", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 91", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 92", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 93", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product 94", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 95", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 96", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 97", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 98", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 99", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product a9", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product b0", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product c1", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product d2", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product e3", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product f4", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product g5", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product h6", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product i7", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product j9", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product k0", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product l1", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product m2", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product n3", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product o4", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product p5", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product q6", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product r7", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product s9", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product t0", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product u1", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product v2", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product w3", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product x4", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product y5", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product z6", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product aa7", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 19x", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 2d0", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 2d1", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product 22d", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 2s3", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 24s", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 25s", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 26s", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 27w", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},

  ];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getString('productgrid_favorite_products');

    if (savedFavorites != null) {
      final List<Map<String, dynamic>> favoriteProducts =
      List<Map<String, dynamic>>.from(jsonDecode(savedFavorites));

      for (var product in expolore2) {
        product["isLiked"] =
            favoriteProducts.any((fav) => fav["name"] == product["name"]);
      }
    }
    setState(() {
      isLoading = false; // Done loading favorites
    });
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteProducts = [
      ...expolore2.where((product) => product["isLiked"]),

    ];
    prefs.setString(
        'productgrid_favorite_products', jsonEncode(favoriteProducts));
  }

  void _scrollToSection(int sectionIndex) {
    setState(() {
      selectedIndex = sectionIndex;
    });

    // Calculate the scroll position to align the section at the top
    double scrollToPosition = sectionIndex * (3 * rowHeight + titleHeight);

    _scrollController.animateTo(
      scrollToPosition,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  // This method creates the titles and rows, ensuring titles come before items
  List<Widget> _buildListItems() {
    List<Widget> items = [];
    int rowsAdded = 0; // Track the number of rows added
    int sectionIndex = 0;

    for (int i = 0; i < totalItems; i += itemsPerRow) {
      // Add the title row after every 3 rows
      if (rowsAdded % 3 == 0) {
        String title = sectionIndex < expolore1.length
            ? expolore1[sectionIndex]['name']
            : "Section ${sectionIndex + 1}"; // Default title

        items.add(
          Container(
            height: titleHeight, // Title height
            padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title, // Display the title
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent, // Stylish color
                  ),
                ),
                SizedBox(width: 10), // Add space
                Expanded(
                  child: Divider(
                    color: Colors.blue,
                    thickness: 2.0, // Make divider more prominent
                  ),
                ),
              ],
            ),
          ),
        );
        sectionIndex++;
      }

      // Add rows of grid items
      items.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            itemsPerRow,
                (index) {
              int currentIndex = i + index;
              if (currentIndex >= expolore2.length) return SizedBox.shrink(); // Don't display if index exceeds available items

              final product = expolore2[currentIndex];

              return Expanded(
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
                  child: InkWell(
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
                    splashColor: Colors.blue.withAlpha(30),
                    highlightColor: Colors.blue.withAlpha(50),
                    borderRadius: BorderRadius.circular(16.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(product["image"]!),
                            backgroundColor: Colors.white,
                            radius: 40, // Set the size of the circle avatar
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            product["name"]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );

      rowsAdded++;
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Categories"),
        actions: [ IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchScreen()),
            );
          },
        ),
          // Favorite Icon Button
          IconButton(
            icon: Icon(Icons.favorite_border),  // Change to Icons.favorite for liked state
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    SaveScreen(),
              ));
            },
          ),
          SizedBox(width: 9,),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 11, // Width of the button column
              color: Colors.blue.shade50, // Set background color for the entire column
              child: ListView.builder(
                controller: _buttonScrollController,
                itemCount: expolore1.length, // Number of buttons
                itemBuilder: (context, index) {
                  // Access product data using the expolore1 list
                  var product = expolore1[index];

                  return Column(
                    children: [
                      // Wrap each button with a Card, but with no margin
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0), // No vertical margin
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GestureDetector(
                          onTap: () => _scrollToSection(index),
                          child: Container(
                            width: double.infinity, // Make the button fill the width of the container
                            height: 100, // Height of each button
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? Colors.white // Selected button color
                                  : Colors.blue.shade50,
                            ),
                            child: Column(
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: Container(
                                    margin: EdgeInsets.all(8.0),
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                    ),
                                    child: Image.asset(
                                      product["image"]!, // Correct reference to image
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  product["name"], // Correct reference to name
                                  style: TextStyle(
                                    fontSize: 12, // Font size for the text
                                    fontWeight: FontWeight.w600,
                                    color: selectedIndex == index
                                        ? Colors.red // Text color for selected button
                                        : Colors.black87, // Text color for non-selected buttons
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Divider with a small height and color to separate buttons
                      Divider(
                        color: Colors.grey.shade300, // Divider color
                        height: 1, // Divider height
                        thickness: 1, // Thickness of the divider
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: ListView(
                controller: _scrollController,
                padding: EdgeInsets.all(5.0),
                children: _buildListItems(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
