import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loginappnew/botamscreen/setting.dart';
import 'package:loginappnew/burger.dart';
import 'package:loginappnew/search%20screen.dart';
import 'package:loginappnew/utils/const.dart';
import 'package:loginappnew/webscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../new save.dart';
import '../setting/profile.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> allProducts1 = [
    {
      "name": "Product 6",
      "price": "₹1200",
      "image": "images/img_7.png",
      "discount": "20% off",
      "isLiked": false
    },
    {
      "name": "Product 7",
      "price": "₹500",
      "image": "images/img_8.png",
      "discount": "10% off",
      "isLiked": false
    },
    {
      "name": "Product 17",
      "price": "₹1200",
      "image": "images/img_18.png",
      "discount": "20% off",
      "isLiked": false
    },
    {
      "name": "Product 9",
      "price": "₹500",
      "image": "images/img_7.png",
      "discount": "10% off",
      "isLiked": false
    },
    {
      "name": "Product 1",
      "price": "₹99",
      "image": "images/img_7.png",
      "discount": "20% off",
      "isLiked": false
    },
    {
      "name": "Product 2",
      "price": "₹500",
      "image": "images/img_8.png",
      "discount": "10% off",
      "isLiked": false
    },
    {
      "name": "Product 3",
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
    // {
    //   "name": "Product 5",
    //   "price": "₹1200",
    //   "image": "images/img_4.png",
    //   "discount": "20% off",
    //   "isLiked": false
    // },
  ];
  List<Map<String, dynamic>> allProducts2 = [
    {
      "name": "Product 6",
      "price": "₹1200",
      "image": "images/img_7.png",
      "discount": "20% off",
      "isLiked": false
    },
    {
      "name": "Product 7",
      "price": "₹500",
      "image": "images/img_7.png",
      "discount": "10% off",
      "isLiked": false
    },
    {
      "name": "Product 8",
      "price": "₹1200",
      "image": "images/img_7.png",
      "discount": "20% off",
      "isLiked": false
    },
    {
      "name": "Product 9",
      "price": "₹500",
      "image": "images/img_7.png",
      "discount": "10% off",
      "isLiked": false
    },
    // {
    //   "name": "Product 10",
    //   "price": "₹1200",
    //   "image": "images/img_7.png",
    //   "discount": "20% off",
    //   "isLiked": false
    // },
  ];
  List<Map<String, dynamic>> clothproduct1 = [
    {
      "name": "Product 1",
      "price": "₹99",
      "image": "images/img_7.png",
      "discount": "20% off",
      "isLiked": false
    },
    {
      "name": "Product 2",
      "price": "₹500",
      "image": "images/img_8.png",
      "discount": "10% off",
      "isLiked": false
    },
    {
      "name": "Product 3",
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
  ];

  // Load saved favorites from SharedPreferences for both products lists
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getString('homepage_favorite_products');

    if (savedFavorites != null) {
      final List<Map<String, dynamic>> favoriteProducts =
          List<Map<String, dynamic>>.from(jsonDecode(savedFavorites));

      // Update 'isLiked' status for products in both lists
      for (var product in allProducts1) {
        product["isLiked"] =
            favoriteProducts.any((fav) => fav["name"] == product["name"]);
      }

      for (var product in allProducts2) {
        product["isLiked"] =
            favoriteProducts.any((fav) => fav["name"] == product["name"]);
      }

      setState(() {}); // Rebuild UI after loading favorites
    }
  }

  // Save the updated favorites list to SharedPreferences for both product lists
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final favoriteProducts = [
      ...allProducts1.where((product) => product["isLiked"]),
      ...allProducts2.where((product) => product["isLiked"])
    ];

    prefs.setString('homepage_favorite_products', jsonEncode(favoriteProducts));
  }

  // Toggle the favorite status of a product and save the changes
  void _toggleFavorite(Map<String, dynamic> product) {
    setState(() {
      product["isLiked"] = !product["isLiked"];
    });
    _saveFavorites();
  }

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

  int currentIndex = 0;
  ScrollController scrollController = ScrollController();
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  void initState() {
    super.initState();
    _loadFavorites();
    _initializePreferences();
    scrollableItems = allItems;
    autoScroll(); // Start the auto-scrolling after initialization
  }

  String? base64Image;
  late List<String> scrollableItems = [];

  final List<String> items = [
    "images/img_14.png",
    "images/img_15.png",
    "images/img_16.png",
    "images/img_17.png",
    "images/img_14.png",

  ];
  final List<String> allItems1 = [
    "images/img_18.png",
    "images/img_19.png",
    "images/img_20.png",
    "images/img_21.png",
    "images/img_18.png",
    "images/img_19.png",
    "images/img_20.png",
    "images/img_21.png",

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
  Future<void> _initializePreferences() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {}); // trigger rebuild once the preferences are loaded
  }

  SharedPreferences? _preferences; // Change to nullable
  @override
  Widget build(BuildContext context) {
    String userName = _preferences?.getString('name') ?? '';
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 399,  decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepOrange, // Color at the top
                Colors.white,     // Fading to transparent at the bottom
              ],
              begin: Alignment.topCenter,  // Start at the top
              end: Alignment.bottomCenter, // End at the bottom
              stops: [0.0, 0.2],          // The stop points to control the gradient distribution
            ),
          ),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 1, vertical: 5),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.all(2),
                                              primary: Colors.transparent,
                                              shadowColor: Colors.transparent,
                                            ),
                                            onPressed: () {},
                                            child: CircleAvatar(
                                              radius:
                                              20, // Fixed radius for CircleAvatar
                                              backgroundImage: base64Image != null
                                                  ? MemoryImage(
                                                  base64Decode(base64Image!))
                                                  : const AssetImage(
                                                  'images/img_13.png')
                                              as ImageProvider,
                                              backgroundColor: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: ListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.zero,
                                          title: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Hello,",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.blueGrey.shade800,
                                                ),
                                              ),
                                              Text(
                                                "$userName",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.blueGrey.shade800,
                                                ),
                                              ),
                                            ],
                                          ),
                                          trailing: IconButton(
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 23,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    SaveScreen(),
                                              ));
                                            },
                                          ),
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  SettingScreen(product: {},),
                                            ));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            Container(
                              height:
                              1, // Space between the card and search container
                              color: Colors.white, // White color background
                            ),
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
                                   Icon(
                                        Icons.clear,
                                        color: Color(0xFFFF7043),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 9),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Stack(children: [
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
                  'Category >', // The word you want to style
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
            height: 5,
          ),
          SizedBox(
            height: 100, // Height of the horizontal ListView
            child: ListView.builder(
              itemCount: foodname.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            switch (index) {
                              case 0:
                                return ProductListScreen(
                                    products: allProducts1);
                              case 1:
                                return ProductListScreen(
                                    products: clothproduct1);
                              case 2:
                                return ProductListScreen(
                                    products: allProducts1);
                              case 3:
                                return ProductListScreen(
                                    products: allProducts2);
                              case 4:
                                return ProductListScreen(
                                    products: allProducts2);
                              case 5:
                                return ProductListScreen(
                                    products: allProducts2);
                              case 6:
                                return ProductListScreen(
                                    products: allProducts2);
                              case 7:
                                return ProductListScreen(
                                    products: allProducts2);
                              case 8:
                                return ProductListScreen(
                                    products: allProducts1);

                              default:
                                return ProductListScreen(products: []);
                            }
                          },
                        ),
                      );
                    },
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50, // Background color for the icon
                            borderRadius: BorderRadius.circular(12), // Rounded corners

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(8), // Padding around the icon
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [ Image.asset(
                              allItems1[index],
                                  width: 35, // Set width of the image
                                  height: 50, // Set height of the image
                                  fit: BoxFit.contain, // Ensures the image fits properly inside the container
                                ),

                              const SizedBox(height: 8),
                              Text(
                                foodname[index], // Dynamic food name based on the index
                                style: TextStyle(
                                  fontSize: 12, // Slightly larger text size for better readability
                                  fontWeight: FontWeight.w600, // Bold weight for emphasis
                                  color: Colors.black87, // Soft black color for readability
                                  letterSpacing: 0.5, // Slightly spaced letters for a modern look
                                  height: 1.3, // Slightly increased line height for better spacing
                                ),
                              ),
                            ],
                          )
                        ),
                      ],
                    )
                  ),
                );
              },
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
                childAspectRatio: 0.75,
              ),
              itemCount: allProducts1.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero, // Ensure no additional padding
              itemBuilder: (context, index) {
                final product = allProducts1[index];
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange.shade200,
                          Colors.white,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: Offset(2, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15)),
                              child: Image.asset(
                                product["image"], // Image path
                                width: double.infinity,
                                height: 175,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(
                                  product["isLiked"]
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: product["isLiked"]
                                      ? Colors.red
                                      : Colors.white,
                                  size: 25,
                                ),
                                onPressed: () => _toggleFavorite(product),
                                iconSize: 24,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product["name"],
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    product["price"],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 11),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal:
                                            8), // Padding around the text
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // Background color for discount text
                                      borderRadius: BorderRadius.circular(
                                          5), // Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.red.shade200
                                              .withOpacity(0.5),
                                          offset: Offset(1, 1),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      product["discount"],
                                      style: TextStyle(
                                        fontSize: 12, // Font size
                                        fontWeight:
                                            FontWeight.bold, // Bold text
                                        color: Colors.red
                                            .shade700, // Text color to match the background
                                        letterSpacing:
                                            1.0, // Adds some spacing between letters
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0), // Padding for spacing
            decoration: BoxDecoration(
              color: Color(0xFFFF7043), // Background color
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8)), // Rounded corners
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crazy offers',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'on your fav brands!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'order now',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0), // Spacing before the image
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      8.0), // Optional rounded corners for image
                  child: Image.asset(
                    localImage2,
                    // fit: BoxFit.cover,
                    height: 201, // Specify a fixed height
                    width: double
                        .infinity, // Takes the full width of the container
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
