import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loginappnew/search%20screen.dart';
import 'package:loginappnew/webscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class explore extends StatefulWidget {
  @override
  _exploreState createState() => _exploreState();
}

class _exploreState extends State<explore> {
  List<Map<String, dynamic>> clothproduct1 = [
    {"name": "Product 1", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 2", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 3", "price": "₹500", "image": "images/img_9.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 4", "price": "₹1200", "image": "images/img_10.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 5", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product 6", "price": "₹1200", "image": "images/img_10.png", "discount": "20% off", "isLiked": false},
    {"name": "Product 7", "price": "₹500", "image": "images/img_11.png", "discount": "10% off", "isLiked": false},
    {"name": "Product 8", "price": "₹1200", "image": "images/img11.jpg", "discount": "20% off", "isLiked": false},

  ];
  List<Map<String, dynamic>> clothproduct2 = [
    {"name": "Product a", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
    {"name": "Product b", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product c", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
    {"name": "Product d", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
    {"name": "Product e", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product f", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
    {"name": "Product g", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
    {"name": "Product h", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},

  ];
  List<Map<String, dynamic>> clothproduct3 = [
    {"name": "Product A", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product B", "price": "₹500", "image": "images/img_8.png", "discount": "10% off", "isLiked": false},
    {"name": "Product C", "price": "₹1200", "image": "images/img_9.png", "discount": "20% off", "isLiked": false},
    {"name": "Product D", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
    {"name": "Product E", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product F", "price": "₹500", "image": "images/img_7.png", "discount": "10% off", "isLiked": false},
    {"name": "Product G", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
    {"name": "Product H", "price": "₹500", "image": "images/img_7.png", "discount": "10% off", "isLiked": false},
  ];

  // void autoScroll() {
  //   Future.delayed(Duration(seconds: 2), () {
  //     // Delay before scrolling
  //     currentIndex++;
  //     if (currentIndex >= scrollableItems.length) {
  //       currentIndex = 0; // Reset to the start if reached the end
  //     }
  //     scrollController
  //         .animateTo(
  //       currentIndex * 50.0, // Adjusted to match the item height (50)
  //       duration: Duration(milliseconds: 800), // Duration of scroll
  //       curve: Curves.easeInOut,
  //     )
  //         .then((_) {
  //       autoScroll(); // Continue auto-scrolling
  //     });
  //   });
  // }
  void autoScroll() {
    Future.delayed(Duration(seconds: 2), () {
      currentIndex++;
      if (currentIndex >= scrollableItems.length) {
        currentIndex = 0; // Reset to the start if reached the end
      }

      // Ensure ScrollController has clients before trying to animate
      if (scrollController.hasClients) {
        scrollController.animateTo(
          currentIndex * 50.0, // Adjusted to match the item height (50)
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        ).then((_) {
          autoScroll(); // Continue auto-scrolling
        });
      } else {
        // Debugging log if the controller isn't attached yet
        print('ScrollController is not attached!');
      }
    });
  }

  ScrollController scrollController = ScrollController();
  int currentIndex = 0;
  bool isLogin = false;
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override

  late List<String> scrollableItems = [];

  final List<String> items = [
    "images/img_16.png",
    "images/img_17.png",
    "images/img_14.png",
    "images/img_14.png",
    "images/img_15.png",
  ];
  final List<String> allItems = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Eggfruit',
    'Fig',
    'Grape',
    'Honeydew',
  ];
  final List foodname = [
    "Burger",
    "Fresh Veg",
    "Drinks",
    "Bakery",
    "Burgers",
    "Fresh Veg",
    "Drinks",
    "Bakery",
  ];
  @override
  void initState() {
    super.initState();
    _loadFavorites();
    scrollableItems = allItems;
    autoScroll();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getString('productgrid_favorite_products');
    if (savedFavorites != null) {
      final List<Map<String, dynamic>> favoriteProducts =
      List<Map<String, dynamic>>.from(jsonDecode(savedFavorites));
      for (var product in clothproduct1) {
        product["isLiked"] = favoriteProducts.any((fav) => fav["name"] == product["name"]);
      }
      for (var product in clothproduct2) {
        product["isLiked"] = favoriteProducts.any((fav) => fav["name"] == product["name"]);
      }
      for (var product in clothproduct3) {
        product["isLiked"] = favoriteProducts.any((fav) => fav["name"] == product["name"]);
      }
      setState(() {});
    }
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteProducts = [
      ...clothproduct1.where((product) => product["isLiked"]),
      ...clothproduct2.where((product) => product["isLiked"]),
      ...clothproduct3.where((product) => product["isLiked"]),
    ];
    prefs.setString('productgrid_favorite_products', jsonEncode(favoriteProducts));
  }

  void _toggleFavorite(Map<String, dynamic> product) {
    setState(() {
      product["isLiked"] = !product["isLiked"];
    });
    _saveFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepOrangeAccent.shade200,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,  // Start at the top
                  end: Alignment.bottomCenter, // End at the bottom
                  stops: [0.0, 0.5],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()),
                      );
                    },
                    child: Container(
                      height: 43,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFFF7043),
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          // Optional box shadow for the search box
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.black87,
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                              width: 70,
                              child: const Text(
                                'Search for',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black87),
                              )),
                          Expanded(
                            flex: 1,
                            child: ClipRect(
                              child: ListView.builder(
                                shrinkWrap: true,
                                controller: scrollController,
                                scrollDirection: Axis.vertical,
                                itemCount: scrollableItems.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 50,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      scrollableItems[
                                      index], // Directly use index
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: Color(0xFFFF7043),
                            ),
                            onPressed: () {
                              // Add clear action here
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 230,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white24, // Set color inside BoxDecoration
                              borderRadius: BorderRadius.circular(15.0), // Apply rounded corners here

                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0), // Apply rounded corners to the entire container
                              child: CarouselSlider(
                                carouselController: _controller,
                                items: List.generate(
                                  items.length,
                                      (int index) => Hero(
                                    tag: 'carouselImage$index',
                                    child: Image.asset(
                                      items[index],
                                      width: MediaQuery.of(context).size.width,
                                      height: 230, // Adjusted height to match container height
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                options: CarouselOptions(
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.easeInOut,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 5,
                                  aspectRatio: 1.0,
                                  viewportFraction: 1.0,
                                  onPageChanged: (index, value) {
                                    setState(() {
                                      _current = index;
                                    });
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 11,
                          right: 90,
                          left: 90,
                          child: SizedBox(
                            height: 13, // Height for the dots
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                items.length,
                                    (int index) => GestureDetector(
                                  onTap: () => _controller.animateToPage(index),
                                  child: AnimatedContainer(
                                    duration: Duration(
                                        milliseconds: 300), // Smooth animation
                                    width: _current == index
                                        ? 20.0
                                        : 10.0, // Increase size when active
                                    height: 8.0, // Height of the rectangle
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 4.0, // Reduced vertical margin
                                      horizontal:
                                      4.0, // Adjusted horizontal space between dots
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          2), // Rounded corners for rectangles
                                      color: _current == index
                                          ? Colors.orange // Active dot color
                                          : Colors.white, // Inactive dot color
                                      boxShadow: _current == index
                                          ? [] // Shadow when active
                                          : [], // No shadow when inactive
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                ],
              ),
            ),
            SizedBox(
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 11,),
                  Text(
                    'Popular Items >', // The word you want to style
                    style: TextStyle(
                      fontSize: 17.0, // Font size for large text
                      fontWeight: FontWeight.bold, // Bold text
                      color: Colors.black,

                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 197,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...clothproduct2.map((product) {
                          return GestureDetector(
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
                              margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    product["image"]!,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    product["name"]!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                    Row(
                      children: [
                        ...clothproduct3.map((product) {
                          return GestureDetector(
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
                              margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0), // Reduced margin
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    product["image"]!,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    product["name"]!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 7,),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "WHAT'S ON YOUR MIND?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.black87,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black87,
                        thickness: 1.0,
                        endIndent: 16.0,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: clothproduct1.length,
                    itemExtent: 150,
                    itemBuilder: (context, index) {
                      final product = clothproduct1[index];
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
                                Container(
                                  height: 150,
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
                                            color: product["isLiked"] ? Colors.red : Colors.white,size: 25,
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
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8), // Padding around the text
                                        decoration: BoxDecoration(
                                          color: Colors.white, // Background color for discount text
                                          borderRadius: BorderRadius.circular(5), // Rounded corners
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.red.shade200.withOpacity(0.5),
                                              offset: Offset(1, 1),
                                              blurRadius: 4,
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          product["discount"],
                                          style: TextStyle(
                                            fontSize: 12, // Font size
                                            fontWeight: FontWeight.bold, // Bold text
                                            color: Colors.red.shade700, // Text color to match the background
                                            letterSpacing: 1.0, // Adds some spacing between letters
                                          ),
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

              ],
            ),

          ],
        ),

      )
    );
  }
}
