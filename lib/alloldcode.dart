// import 'package:flutter/material.dart';
// import 'categoris.dart';
// import 'homepage.dart';
//
// class botambar extends StatefulWidget {
//   @override
//   _botambarState createState() => _botambarState();
// }
//
// class _botambarState extends State<botambar> {
//   int _selectedIndex = 0;
//   double _iconSize = 24;
//
//   final List<Widget> _widgetOptions = [
//     homepage(),
//     HorizontalListViewExample(),
//     Text('Notifications', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//     Text('Profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//     Text('Settings', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (_selectedIndex != 0) {
//           setState(() {
//             _selectedIndex = 0; // Navigate to Home when back button is pressed
//           });
//           return false;
//         }
//         return true; // Allow back button to exit the app if on Home
//       },
//       child: Scaffold(
//         body: Center(
//           child: _widgetOptions.elementAt(_selectedIndex),
//         ),
//         bottomNavigationBar: Container(
//           decoration: BoxDecoration(
//             color: Colors.white, // Set bottom navigation bar background to white
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 10,
//                 offset: Offset(0, -2),
//               ),
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//             child: BottomNavigationBar(
//               items: <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 0 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.food_bank_outlined, size: _selectedIndex == 0 ? 24 : 20), // Animated size
//                   ),
//                   label: 'Foodzone',
//                 ),
//
//
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 1 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.grid_view_rounded, size: _selectedIndex == 1 ? 24 : 20),
//                   ),
//                   label: 'Categories',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 2 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.explore_rounded, size: _selectedIndex ==
//                         2 ? 24 : 20),
//                   ),
//                   label: 'Explore',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 3 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.person_rounded, size: _selectedIndex == 3 ? 24 : 20),
//                   ),
//                   label: 'Profile',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 4 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.shopping_cart_outlined, size: _selectedIndex == 4 ?24 : 20),
//                   ),
//                   label: 'Cart',
//                 ),
//               ],
//               currentIndex: _selectedIndex,
//               selectedItemColor: Color(0xFFFF7043),  // Orange color for selected icon
//               unselectedItemColor: Colors.black87, // Lighter orange for unselected icons
//               showUnselectedLabels: true,
//               selectedFontSize: 13,
//               unselectedFontSize: 11,
//               type: BottomNavigationBarType.fixed,
//               onTap: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//               backgroundColor: Colors.white, // Set bottom navigation background to white
//               elevation: 10,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
///
// import 'package:flutter/material.dart';
// import 'package:loginappnew/setting/setting.dart';
// import 'addtocart.dart';
// import 'explore.dart';
// import 'categoress.dart';
// import 'homepage.dart';
// import 'new save.dart';
//
// class botambar extends StatefulWidget {
//   @override
//   _botambarState createState() => _botambarState();
// }
//
// class _botambarState extends State<botambar> {
//
//   int _selectedIndex = 0;
//   double _iconSize = 24;
//
//   final List<Widget> _widgetOptions = [
//     Homepage(),
//     ProductGrid(),
//     Explore(),
//     AddToCartScreen(),
//     SettingScreen(product: {},),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (_selectedIndex != 0) {
//           setState(() {
//             _selectedIndex = 0; // Navigate to Home when back button is pressed
//           });
//           return false;
//         }
//         return true; // Allow back button to exit the app if on Home
//       },
//       child: Scaffold(
//         body: Center(
//           child: _widgetOptions.elementAt(_selectedIndex),
//         ),
//         bottomNavigationBar: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 10,
//                 offset: Offset(0, -2),
//               ),
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//             child: BottomNavigationBar(
//               items: <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 0 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.food_bank_outlined, size: _selectedIndex == 0 ? 24 : 20), // Animated size
//                   ),
//                   label: 'Foodzone',
//                 ),
//
//
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 1 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.grid_view_rounded, size: _selectedIndex == 1 ? 24 : 20),
//                   ),
//                   label: 'Categories',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 2 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.explore_rounded, size: _selectedIndex ==
//                         2 ? 24 : 20),
//                   ),
//                   label: 'Explore',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 3 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.shopping_cart_outlined, size: _selectedIndex == 3 ? 24 : 20),
//                   ),
//                   label: 'Cart',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 4 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.person_rounded, size: _selectedIndex == 4 ?24 : 20),
//                   ),
//                   label: 'Profile',
//                 ),
//               ],
//               currentIndex: _selectedIndex,
//               selectedItemColor: Color(0xFFFF7043),  // Orange color for selected icon
//               unselectedItemColor: Colors.black87, // Lighter orange for unselected icons
//               showUnselectedLabels: true,
//               selectedFontSize: 13,
//               unselectedFontSize: 11,
//               type: BottomNavigationBarType.fixed,
//               onTap: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//               backgroundColor: Colors.white, // Set bottom navigation background to white
//               elevation: 10,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
///last comp botambar
// import 'package:flutter/material.dart';
// import 'package:loginappnew/setting/setting.dart';
// import 'addtocart.dart';
// import 'explore.dart';
// import 'categoress.dart';
// import 'homepage.dart';
//
// class botambar extends StatefulWidget {
//   @override
//   _botambarState createState() => _botambarState();
// }
//
// class _botambarState extends State<botambar> {
//   int _selectedIndex = 0;
//   double _iconSize = 24;
//
//   final List<Widget> _widgetOptions = [
//     Homepage(),
//     ProductGrid(),
//     Explore(),
//     AddToCartScreen(),
//     SettingScreen(product: {},),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (_selectedIndex != 0) {
//           setState(() {
//             _selectedIndex = 0; // Navigate to Home when back button is pressed
//           });
//           return false;
//         }
//         return true; // Allow back button to exit the app if on Home
//       },
//       child: Scaffold(
//         body: Center(
//           child: _widgetOptions.elementAt(_selectedIndex),
//         ),
//         bottomNavigationBar: _selectedIndex == 3
//             ? null // Hide the bottom navigation bar if the current selected index is 3 (AddToCartScreen)
//             : Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 10,
//                 offset: Offset(0, -2),
//               ),
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//             child: BottomNavigationBar(
//               items: <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 0 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.food_bank_outlined, size: _selectedIndex == 0 ? 24 : 20), // Animated size
//                   ),
//                   label: 'Foodzone',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 1 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.grid_view_rounded, size: _selectedIndex == 1 ? 24 : 20),
//                   ),
//                   label: 'Categories',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 2 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.explore_rounded, size: _selectedIndex == 2 ? 24 : 20),
//                   ),
//                   label: 'Explore',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 3 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.shopping_cart_outlined, size: _selectedIndex == 3 ? 24 : 20),
//                   ),
//                   label: 'Cart',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     padding: EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == 4 ? Color(0xFFFF7043).withOpacity(0.3) : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.person_rounded, size: _selectedIndex == 4 ? 24 : 20),
//                   ),
//                   label: 'Profile',
//                 ),
//               ],
//               currentIndex: _selectedIndex,
//               selectedItemColor: Color(0xFFFF7043),  // Orange color for selected icon
//               unselectedItemColor: Colors.black87, // Lighter orange for unselected icons
//               showUnselectedLabels: true,
//               selectedFontSize: 13,
//               unselectedFontSize: 11,
//               type: BottomNavigationBarType.fixed,
//               onTap: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//               backgroundColor: Colors.white, // Set bottom navigation background to white
//               elevation: 10,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
///home
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:loginappnew/burger.dart';
// import 'package:loginappnew/search%20screen.dart';
// import 'package:loginappnew/utils/const.dart';
// import 'package:loginappnew/webscreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// import 'botamproductgrid.dart';
// import 'explore.dart';
//
// class Homepage extends StatefulWidget {
//   @override
//   _HomepageState createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//
//   List<Map<String, dynamic>> allProducts1 = [
//     {
//       "name": "Product 1",
//       "price": "₹99",
//       "image": "images/img_7.png",
//       "discount": "20% off",
//       "isLiked": false
//     },
//     {
//       "name": "Product 2",
//       "price": "₹500",
//       "image": "images/img_8.png",
//       "discount": "10% off",
//       "isLiked": false
//     },
//     {
//       "name": "Product 3",
//       "price": "₹1200",
//       "image": "images/img_9.png",
//       "discount": "20% off",
//       "isLiked": false
//     },
//     {
//       "name": "Product 4",
//       "price": "₹500",
//       "image": "images/img_10.png",
//       "discount": "10% off",
//       "isLiked": false
//     },
//     // {
//     //   "name": "Product 5",
//     //   "price": "₹1200",
//     //   "image": "images/img_4.png",
//     //   "discount": "20% off",
//     //   "isLiked": false
//     // },
//   ];
//   List<Map<String, dynamic>> allProducts2 = [
//     {
//       "name": "Product 6",
//       "price": "₹1200",
//       "image": "images/img_7.png",
//       "discount": "20% off",
//       "isLiked": false
//     },
//     {
//       "name": "Product 7",
//       "price": "₹500",
//       "image": "images/img_7.png",
//       "discount": "10% off",
//       "isLiked": false
//     },
//     {
//       "name": "Product 8",
//       "price": "₹1200",
//       "image": "images/img_7.png",
//       "discount": "20% off",
//       "isLiked": false
//     },
//     {
//       "name": "Product 9",
//       "price": "₹500",
//       "image": "images/img_7.png",
//       "discount": "10% off",
//       "isLiked": false
//     },
//     // {
//     //   "name": "Product 10",
//     //   "price": "₹1200",
//     //   "image": "images/img_7.png",
//     //   "discount": "20% off",
//     //   "isLiked": false
//     // },
//   ];
//   List<Map<String, dynamic>> clothproduct1 = [
//     {"name": "Product 1", "price": "₹99", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 2", "price": "₹500", "image": "images/img_8.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 3", "price": "₹1200", "image": "images/img_9.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 4", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//   ];
//
//   // Load saved favorites from SharedPreferences for both products lists
//   Future<void> _loadFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedFavorites = prefs.getString('homepage_favorite_products');
//
//     if (savedFavorites != null) {
//       final List<Map<String, dynamic>> favoriteProducts =
//           List<Map<String, dynamic>>.from(jsonDecode(savedFavorites));
//
//       // Update 'isLiked' status for products in both lists
//       for (var product in allProducts1) {
//         product["isLiked"] =
//             favoriteProducts.any((fav) => fav["name"] == product["name"]);
//       }
//
//       for (var product in allProducts2) {
//         product["isLiked"] =
//             favoriteProducts.any((fav) => fav["name"] == product["name"]);
//       }
//
//       setState(() {}); // Rebuild UI after loading favorites
//     }
//   }
//
//   // Save the updated favorites list to SharedPreferences for both product lists
//   Future<void> _saveFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     final favoriteProducts = [
//       ...allProducts1.where((product) => product["isLiked"]),
//       ...allProducts2.where((product) => product["isLiked"])
//     ];
//
//     prefs.setString('homepage_favorite_products', jsonEncode(favoriteProducts));
//   }
//
//   // Toggle the favorite status of a product and save the changes
//   void _toggleFavorite(Map<String, dynamic> product) {
//     setState(() {
//       product["isLiked"] = !product["isLiked"];
//     });
//     _saveFavorites();
//   }
//
//   // void autoScroll() {
//   //   Future.delayed(Duration(seconds: 2), () {
//   //     // Delay before scrolling
//   //     currentIndex++;
//   //     if (currentIndex >= scrollableItems.length) {
//   //       currentIndex = 0; // Reset to the start if reached the end
//   //     }
//   //     scrollController
//   //         .animateTo(
//   //       currentIndex * 50.0, // Adjusted to match the item height (50)
//   //       duration: Duration(milliseconds: 800), // Duration of scroll
//   //       curve: Curves.easeInOut,
//   //     )
//   //         .then((_) {
//   //       autoScroll(); // Continue auto-scrolling
//   //     });
//   //   });
//   // }
//
//   ScrollController scrollController = ScrollController();
//   int _current = 0;
//   final CarouselSliderController _controller = CarouselSliderController();
//   @override
//   void initState() {
//     super.initState();
//     _loadFavorites();
//     scrollableItems = allItems;
//     // autoScroll(); // Start the auto-scrolling after initialization
//   }
//
//   late List<String> scrollableItems = [];
//
//   final List<String> items = [
//     "images/img_7.png",
//     "images/img_8.png",
//     "images/img_4.png",
//     "images/img_9.png",
//     "images/img_10.png",
//   ];
//   final List<String> allItems = [
//     'Apple',
//     'Banana',
//     'Cherry',
//     'Date',
//     'Eggfruit',
//     'Fig',
//     'Grape',
//     'Honeydew',
//   ];
//   final List foodname = [
//     "Burger",
//     "Fresh Veg",
//     "Drinks",
//     "Bakery",
//     "Burgers",
//     "Fresh Veg",
//     "Drinks",
//     "Bakery",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 353,
//             color: Color(0xFFFF7043),
//             child: Column(
//               children: [
//                 SizedBox(height: 50,),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SearchScreen()),
//                             );
//                           },
//                           child: Container(
//                             height: 47,
//                             padding: EdgeInsets.all(0),
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Color(0xFFFF7043),
//                                 ),
//                                 borderRadius: BorderRadius.circular(20), // R
//                                 color: Colors.white // ounded, corners
//                                 ),
//                             child: Row(
//                               children: [
//                                 SizedBox(width: 15),
//                                 Icon(
//                                   Icons.search,
//                                   color: Colors.black87,
//                                 ),
//                                 SizedBox(width: 5),
//                                 SizedBox(
//                                     width: 70,
//                                     child: const Text(
//                                       'Search for',
//                                       style: TextStyle(
//                                           fontSize: 15, color: Colors.black87),
//                                     )),
//                                 SizedBox(width: 5),
//                                 Expanded(
//                                   flex: 1,
//                                   child: ClipRect(
//                                     child: ListView.builder(
//                                       shrinkWrap: true,
//                                       controller: scrollController,
//                                       scrollDirection: Axis.vertical,
//                                       itemCount: scrollableItems.length,
//                                       itemBuilder: (context, index) {
//                                         return Container(
//                                           height: 50,
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             scrollableItems[
//                                                 index], // Directly use index
//                                             style: TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.black87),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 5),
//                                 Icon(
//                                   Icons.clear,
//                                   color: Color(0xFFFF7043),
//                                 ),
//                                 SizedBox(width: 8),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       // const SizedBox(
//                       //   width: 11,
//                       // ),
//                       // CircleAvatar(
//                       //   backgroundColor: Colors.white,
//                       //   radius: 23,
//                       //   foregroundColor: Colors.white,
//                       //   child: IconButton(
//                       //       onPressed: () {
//                       //         Navigator.of(context).push(MaterialPageRoute(
//                       //             builder: (BuildContext context) =>
//                       //                 SettingScreen(
//                       //                   product: {},
//                       //                 )));
//                       //       },
//                       //       icon: const Icon(
//                       //         Icons.person,
//                       //         color: Color(0xFFFF7043),
//                       //       )),
//                       // )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 167,
//                   width: MediaQuery.of(context).size.width,
//                   color: Color(0xFFFF7043),
//                   child: CarouselSlider(
//                     carouselController: _controller,
//                     items: List.generate(
//                       items.length,
//                           (int index) => Image.asset(
//                         items[index],
//                         width: MediaQuery.of(context).size.width,
//                         height: 201,
//                         // fit: BoxFit.cover,
//                       ),
//                     ),
//                     options: CarouselOptions(
//                       enableInfiniteScroll: true,
//                       reverse: false,
//                       autoPlay: true,
//                       autoPlayInterval: const Duration(seconds: 3),
//                       autoPlayAnimationDuration:
//                       const Duration(milliseconds: 800),
//                       autoPlayCurve: Curves.easeInOut,
//                       enlargeCenterPage: true,
//                       enlargeFactor: 5,aspectRatio: 1.0, viewportFraction: 1.0,
//                       onPageChanged: (index, value) {
//                         setState(() {
//                           _current = index;
//                         });
//                       },
//                       scrollDirection: Axis.horizontal,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                       height: 13, // Height for the dots
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: List.generate(
//                           items.length,
//                               (int index) => GestureDetector(
//                             onTap: () => _controller.animateToPage(index),
//                             child: AnimatedContainer(
//                               duration: Duration(milliseconds: 300), // Smooth animation
//                               width: _current == index ? 20.0 : 10.0, // Increase size when active
//                               height: 8.0, // Height of the rectangle
//                               margin: const EdgeInsets.symmetric(
//                                 vertical: 4.0, // Reduced vertical margin
//                                 horizontal: 4.0, // Adjusted horizontal space between dots
//                               ),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(2), // Rounded corners for rectangles
//                                 color: _current == index
//                                     ? Colors.brown.shade500 // Active dot color
//                                     : Colors.white, // Inactive dot color
//                                 boxShadow: _current == index
//                                     ? [
//                                 ] // Shadow when active
//                                     : [], // No shadow when inactive
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                 ListTile(
//                       contentPadding: EdgeInsets.symmetric(horizontal: 120.0), // Reduced padding
//                       tileColor: Colors.yellowAccent,
//                       title: Text(
//                         "WHAT'S ON YOUR MIND?",
//                         style: TextStyle(
//                           color: Colors.black87,
//                           fontSize: 11,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       trailing: Icon(
//                         Icons.arrow_forward_ios,
//                         size: 13,
//                         color: Colors.black87,
//                       ),
//                   onTap: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (BuildContext context) => BottomNavBarScreenWithProductGrid()),
//                     );
//                   },
//                     ),
//               ],
//             ),
//           ),
//           SizedBox(height: 7,),
//           SizedBox(
//                   height: 40, // Height of the horizontal ListView
//                   child: ListView.builder(
//                     itemCount: foodname.length,
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 6),
//                         child: TextButton.icon(
//                           onPressed: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (BuildContext context) {
//                                   switch (index) {
//                                     case 0:
//                                       return ProductListScreen(products: allProducts1);
//                                     case 1:
//                                       return ProductListScreen(products: clothproduct1);
//                                     case 2:
//                                       return ProductListScreen(products: allProducts1);
//                                     case 3:
//                                       return ProductListScreen(products: allProducts2);
//                                     case 4:
//                                       return ProductListScreen(products: allProducts2);
//                                     case 5:
//                                       return ProductListScreen(products: allProducts2);
//                                     case 6:
//                                       return ProductListScreen(products: allProducts2);
//                                     case 7:
//                                       return ProductListScreen(products: allProducts2);
//                                     case 8:
//                                       return ProductListScreen(products: allProducts1);
//
//                                     default:
//                                       return ProductListScreen(products: []);
//                                   }
//                                 },
//                               ),
//                             );
//                           },
//                           style: TextButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 10, horizontal: 15), // Consistent padding
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             backgroundColor: Colors.orange.shade200,
//                             shadowColor: Colors.orange.shade50,
//                           ),
//                           label: Text(
//                             foodname[index],
//                             style: const TextStyle(
//                               fontSize: 12,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           icon: const Icon(
//                             Icons.local_pizza_outlined,
//                             size: 18,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 9.0,
//                 mainAxisSpacing: 9.0,
//                 childAspectRatio: 0.75,
//               ),
//               itemCount: allProducts1.length,
//               shrinkWrap: true,
//               physics: const ClampingScrollPhysics(),
//               padding: EdgeInsets.zero, // Ensure no additional padding
//               itemBuilder: (context, index) {
//                 final product = allProducts1[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DetailScreen(
//                           product: product,
//                           onFavoriteChanged: (updatedProduct) {
//                             setState(() {
//                               product["isLiked"] = updatedProduct["isLiked"];
//                             });
//                             _saveFavorites();
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       gradient: LinearGradient(
//                         colors: [
//                           Colors.orange.shade100,
//                           Colors.orange.shade300,
//                         ],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.shade300,
//                           offset: Offset(2, 2),
//                           blurRadius: 6,
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Stack(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//                               child: Image.asset(
//                                 product["image"], // Image path
//                                 width: double.infinity,
//                                 height: 175,
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.topRight,
//                               child: IconButton(
//                                 icon: Icon(
//                                   product["isLiked"] ? Icons.favorite : Icons.favorite_border,
//                                   color: product["isLiked"] ? Colors.red : Colors.white,size: 25,
//                                 ),
//                                 onPressed: () => _toggleFavorite(product),
//                                 iconSize: 24,
//                               ),
//
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 product["name"],
//                                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               SizedBox(height: 4),
//                             Row(
//                               children: [
//                                 Text(
//                                   product["price"],
//                                   style: TextStyle(fontSize: 14, color: Colors.green,fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(width: 11),
//                                 Container(
//                                   padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8), // Padding around the text
//                                   decoration: BoxDecoration(
//                                     color: Colors.white, // Background color for discount text
//                                     borderRadius: BorderRadius.circular(5), // Rounded corners
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.red.shade200.withOpacity(0.5),
//                                         offset: Offset(1, 1),
//                                         blurRadius: 4,
//                                       ),
//                                     ],
//                                   ),
//                                   child: Text(
//                                     product["discount"],
//                                     style: TextStyle(
//                                       fontSize: 12, // Font size
//                                       fontWeight: FontWeight.bold, // Bold text
//                                       color: Colors.red.shade700, // Text color to match the background
//                                       letterSpacing: 1.0, // Adds some spacing between letters
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             )
//
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(16.0), // Padding for spacing
//             decoration: BoxDecoration(
//               color: Color(0xFFFF7043), // Background color
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)), // Rounded corners
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Crazy offers',
//                   style: TextStyle(
//                     fontSize: 50,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'on your fav brands!',
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white, // Text color
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'order now',
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 16.0), // Spacing before the image
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(
//                       8.0), // Optional rounded corners for image
//                   child: Image.asset(
//                     localImage2,
//                     // fit: BoxFit.cover,
//                     height: 201, // Specify a fixed height
//                     width: double
//                         .infinity, // Takes the full width of the container
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }
///product
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:loginappnew/search%20screen.dart';
// import 'package:loginappnew/webscreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
//
//
// class ProductGrid extends StatefulWidget {
//   @override
//   _ProductGridState createState() => _ProductGridState();
// }
//
// class _ProductGridState extends State<ProductGrid> {
//   List<Map<String, dynamic>> clothproduct1 = [
//     {"name": "Product 1", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 2", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 3", "price": "₹500", "image": "images/img_9.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 4", "price": "₹1200", "image": "images/img_10.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 5", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 6", "price": "₹1200", "image": "images/img_10.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 7", "price": "₹500", "image": "images/img_11.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 8", "price": "₹1200", "image": "images/img11.jpg", "discount": "20% off", "isLiked": false},
//
//   ];
//   List<Map<String, dynamic>> clothproduct2 = [
//     {"name": "Product a", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product b", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product c", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product d", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product e", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product f", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product g", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product h", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//
//   ];
//   List<Map<String, dynamic>> clothproduct3 = [
//     {"name": "Product A", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product B", "price": "₹500", "image": "images/img_8.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product C", "price": "₹1200", "image": "images/img_9.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product D", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product E", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product F", "price": "₹500", "image": "images/img_7.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product G", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product H", "price": "₹500", "image": "images/img_7.png", "discount": "10% off", "isLiked": false},
//   ];
//
//   // void autoScroll() {
//   //   Future.delayed(Duration(seconds: 2), () {
//   //     // Delay before scrolling
//   //     currentIndex++;
//   //     if (currentIndex >= scrollableItems.length) {
//   //       currentIndex = 0; // Reset to the start if reached the end
//   //     }
//   //     scrollController
//   //         .animateTo(
//   //       currentIndex * 50.0, // Adjusted to match the item height (50)
//   //       duration: Duration(milliseconds: 800), // Duration of scroll
//   //       curve: Curves.easeInOut,
//   //     )
//   //         .then((_) {
//   //       autoScroll(); // Continue auto-scrolling
//   //     });
//   //   });
//   // }
//   ScrollController scrollController = ScrollController();
//   int currentIndex = 0;
//   bool isLogin = false;
//   int _current = 0;
//   final CarouselSliderController _controller = CarouselSliderController();
//   @override
//
//   late List<String> scrollableItems = [];
//
//   final List<String> items = [
//     "images/img_8.png",
//     "images/img_8.png",
//     "images/img_4.png",
//     "images/img_9.png",
//     "images/img_10.png",
//   ];
//   final List<String> allItems = [
//     'Apple',
//     'Banana',
//     'Cherry',
//     'Date',
//     'Eggfruit',
//     'Fig',
//     'Grape',
//     'Honeydew',
//   ];
//   final List foodname = [
//     "Burger",
//     "Fresh Veg",
//     "Drinks",
//     "Bakery",
//     "Burgers",
//     "Fresh Veg",
//     "Drinks",
//     "Bakery",
//   ];
//   @override
//   void initState() {
//     super.initState();
//     _loadFavorites();
//     scrollableItems = allItems;
//     // autoScroll();
//   }
//
//   Future<void> _loadFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedFavorites = prefs.getString('productgrid_favorite_products');
//     if (savedFavorites != null) {
//       final List<Map<String, dynamic>> favoriteProducts =
//       List<Map<String, dynamic>>.from(jsonDecode(savedFavorites));
//       for (var product in clothproduct1) {
//         product["isLiked"] = favoriteProducts.any((fav) => fav["name"] == product["name"]);
//       }
//       for (var product in clothproduct2) {
//         product["isLiked"] = favoriteProducts.any((fav) => fav["name"] == product["name"]);
//       }
//       for (var product in clothproduct3) {
//         product["isLiked"] = favoriteProducts.any((fav) => fav["name"] == product["name"]);
//       }
//       setState(() {});
//     }
//   }
//
//   Future<void> _saveFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final favoriteProducts = [
//       ...clothproduct1.where((product) => product["isLiked"]),
//       ...clothproduct2.where((product) => product["isLiked"]),
//       ...clothproduct3.where((product) => product["isLiked"]),
//     ];
//     prefs.setString('productgrid_favorite_products', jsonEncode(favoriteProducts));
//   }
//
//   void _toggleFavorite(Map<String, dynamic> product) {
//     setState(() {
//       product["isLiked"] = !product["isLiked"];
//     });
//     _saveFavorites();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Container(
//             height: 250,
//             color: Color(0xFFFF7043),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SearchScreen()),
//                             );
//                           },
//                           child: Container(
//                             height:
//                             47,
//                             width:
//                             90,
//                             padding: EdgeInsets.all(
//                                 0),
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Color(0xFFFF7043),
//                                 ),
//                                 borderRadius: BorderRadius.circular(20), // R
//                                 color: Colors.white // ounded, corners
//                             ),
//                             child: Row(
//                               children: [
//                                 SizedBox(width: 15),
//                                 Icon(
//                                   Icons.search,
//                                   color: Colors.black87,
//                                 ),
//                                 SizedBox(width: 5),
//                                 SizedBox(
//                                     width: 70,
//                                     child: const Text(
//                                       'Search for',
//                                       style: TextStyle(
//                                           fontSize: 14, color: Colors.black87),
//                                     )),
//                                 Expanded(
//                                   flex: 1,
//                                   child: ClipRect(
//                                     child: ListView.builder(
//                                       shrinkWrap: true,
//                                       controller: scrollController,
//                                       scrollDirection: Axis.vertical,
//                                       itemCount: scrollableItems.length,
//                                       itemBuilder: (context, index) {
//                                         return Container(
//                                           height: 50,
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             scrollableItems[
//                                             index], // Directly use index
//                                             style: TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.black87),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 5),
//                                 Icon(
//                                   Icons.clear,
//                                   color: Color(0xFFFF7043),
//                                 ),
//                                 SizedBox(width: 8),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       // const SizedBox(
//                       //   width: 11,
//                       // ),
//                       // CircleAvatar(
//                       //   backgroundColor: Colors.white,
//                       //   radius: 23,
//                       //   foregroundColor: Colors.white,
//                       //   child: IconButton(
//                       //       onPressed: () {
//                       //         // Navigator.of(context).push(MaterialPageRoute(
//                       //         //     builder: (BuildContext context) =>
//                       //         //         SettingScreen(product: {},
//                       //         //         )));
//                       //       },
//                       //       icon: const Icon(
//                       //         Icons.person,
//                       //         color: Color(0xFFFF7043),
//                       //       )),
//                       // )
//                     ],
//                   ),
//                 ),
//                 Container(
//                     height: 160,
//                   width: MediaQuery.of(context).size.width,
//                   color: Color(0xFFFF7043),
//                     child: CarouselSlider(
//                       carouselController: _controller,
//                       items: List.generate(
//                         items.length,
//                             (int index) => Image.asset(
//                           items[index],
//                               width: MediaQuery.of(context).size.width,
//                               height: 201,
//                               // fit: BoxFit.cover,
//                         ),
//                       ),
//                       options: CarouselOptions(
//                         enableInfiniteScroll: true,
//                         reverse: false,
//                         autoPlay: true,
//                         autoPlayInterval: const Duration(seconds: 3),
//                         autoPlayAnimationDuration:
//                         const Duration(milliseconds: 800),
//                         autoPlayCurve: Curves.easeInOut,
//                         enlargeCenterPage: true,
//                         enlargeFactor: 5,aspectRatio: 1.0, viewportFraction: 1.0,
//                         onPageChanged: (index, value) {
//                           setState(() {
//                             _current = index;
//                           });
//                         },
//                         scrollDirection: Axis.horizontal,
//                       ),
//                     ),
//                   ),
//
//                 SizedBox(
//                   height: 20, // Increased height for more space between dots
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                       items.length,
//                           (int index) => GestureDetector(
//                         onTap: () => _controller.animateToPage(index),
//                         child: AnimatedContainer(
//                           duration: Duration(milliseconds: 300), // Smooth animation
//                           width: _current == index ? 20.0 : 10.0, // Increase size when active
//                           height: 8.0, // Height of the rectangle
//                           margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0), // Added horizontal space between dots
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2), // Optional: rounded corners for rectangles
//                             color: _current == index
//                                 ? Colors.brown.shade500 // Active dot color
//                                 : Colors.white, // Inactive dot color
//                             boxShadow: _current == index
//                                 ? [BoxShadow(color: Colors.blueAccent.withOpacity(0), blurRadius: 8, spreadRadius: 1)] // Shadow when active
//                                 : [], // No shadow when inactive
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 197,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       ...clothproduct2.map((product) {
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => DetailScreen(
//                                   product: product,
//                                   onFavoriteChanged: (updatedProduct) {
//                                     setState(() {
//                                       product["isLiked"] = updatedProduct["isLiked"];
//                                     });
//                                     _saveFavorites();
//                                   },
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
//                             padding: const EdgeInsets.all(8.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Image.asset(
//                                   product["image"]!,
//                                   width: 50,
//                                   height: 50,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   product["name"]!,
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     fontSize: 12,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       ...clothproduct3.map((product) {
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => DetailScreen(
//                                   product: product,
//                                   onFavoriteChanged: (updatedProduct) {
//                                     setState(() {
//                                       product["isLiked"] = updatedProduct["isLiked"];
//                                     });
//                                     _saveFavorites();
//                                   },
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0), // Reduced margin
//                             padding: const EdgeInsets.all(8.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Image.asset(
//                                   product["image"]!,
//                                   width: 50,
//                                   height: 50,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   product["name"]!,
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     fontSize: 12,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Text(
//                   "WHAT'S ON YOUR MIND?",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 13,
//                     color: Colors.black87,
//                     letterSpacing: 1.2,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Divider(
//                   color: Colors.black87,
//                   thickness: 1.0,
//                   endIndent: 16.0,
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListView.builder(
//               shrinkWrap: true,
//               physics: const BouncingScrollPhysics(),
//               itemCount: clothproduct1.length,
//               itemExtent: 150,
//               itemBuilder: (context, index) {
//                 final product = clothproduct1[index];
//                 return Material(
//                   color: Colors.transparent,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DetailScreen(
//                             product: product,
//                             onFavoriteChanged: (updatedProduct) {
//                               setState(() {
//                                 product["isLiked"] = updatedProduct["isLiked"];
//                               });
//                               _saveFavorites();
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       height: 199,
//                       margin: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           // Product image with favorite icon
//                           Container(
//                             height: 199,
//                             width: 130,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Colors.pinkAccent.shade100,
//                                   Colors.deepOrangeAccent.shade200,
//                                 ],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.pink.shade100.withOpacity(0.6),
//                                   offset: const Offset(4, 4),
//                                   blurRadius: 10,
//                                 ),
//                               ],
//                             ),
//                             child: Stack(
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(20),
//                                   child: Image.asset(
//                                     product["image"],
//                                     height: 190,
//                                     width: 130,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: Alignment.topRight,
//                                   child: IconButton(
//                                     icon: Icon(
//                                       product["isLiked"] ? Icons.favorite : Icons.favorite_border,
//                                       color: product["isLiked"] ? Colors.red : Colors.white,size: 25,
//                                     ),
//                                     onPressed: () => _toggleFavorite(product),
//                                     iconSize: 25,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(width: 17), // Add spacing between image and text
//                           // Product details
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   product["name"],
//                                   style: const TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black87,
//                                     letterSpacing: 0.5,
//                                   ),
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   product["price"],
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.green.shade700,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Container(
//                                   padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8), // Padding around the text
//                                   decoration: BoxDecoration(
//                                     color: Colors.white, // Background color for discount text
//                                     borderRadius: BorderRadius.circular(5), // Rounded corners
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.red.shade200.withOpacity(0.5),
//                                         offset: Offset(1, 1),
//                                         blurRadius: 4,
//                                       ),
//                                     ],
//                                   ),
//                                   child: Text(
//                                     product["discount"],
//                                     style: TextStyle(
//                                       fontSize: 12, // Font size
//                                       fontWeight: FontWeight.bold, // Bold text
//                                       color: Colors.red.shade700, // Text color to match the background
//                                       letterSpacing: 1.0, // Adds some spacing between letters
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       )
//     );
//   }
// }
///explore
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:loginappnew/webscreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Explore extends StatefulWidget {
//   @override
//   _ExploreState createState() => _ExploreState();
// }
//
// class _ExploreState extends State<Explore> {
//
//   final int itemsPerRow = 3; // Number of grid items per row
//   final int totalItems = 134; // Total grid items
//   final ScrollController _scrollController = ScrollController();
//   final ScrollController _buttonScrollController = ScrollController();
//   double rowHeight = 125.0; // Height of each grid row
//   double titleHeight = 75.0; // Height of each title
//   int selectedIndex = 0; // Default selected index is 0 (first button selected)
//
//   List<Map<String, dynamic>> expolore1 = [
//     {"name": "Fiction", "image": "images/img_6.png"},
//     {"name": "Non-Fiction", "image": "images/img_8.png"},
//     {"name": "Science",  "image": "images/img_9.png"},
//     {"name": "Technology",  "image": "images/img_10.png"},
//     {"name": "History",  "image": "images/img_12.jpg"},
//     {"name": "Biography",  "image": "images/img_10.png"},
//     {"name": "Art & Design",  "image": "images/img_11.png"},
//     {"name": "Travel", "image": "images/img11.jpg"},
//     {"name": "Mystery", "image": "images/img_6.png"},
//     {"name": "Fantasy", "image": "images/img_8.png"},
//     {"name": "Horror",  "image": "images/img_9.png"},
//     {"name": "Adventure",  "image": "images/img_10.png"},
//     {"name": "Fantasy",  "image": "images/img_12.jpg"},
//     {"name": "Horr",  "image": "images/img_10.png"},
//     {"name": "Adventure",  "image": "images/img_11.png"},
//   ];
//
//   List<Map<String, dynamic>> expolore2 = [
//     {"name": "Product 1", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 2", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 3", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product 4", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 5", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 6", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 7", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 8", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 9", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 10", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 11", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 12", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product 13", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 14", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 15", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 16", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 17", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 18", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 19", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 20", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 21", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product 22", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 23", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 24", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 25", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 26", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 27", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 28", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 29", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 30", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product 31", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 32", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 33", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 34", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 35", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 36", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 37", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 38", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 39", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product 40", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 41", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 42", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 43", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 44", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 45", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 46", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 47", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 48", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product 49", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 50", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 51", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 52", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 53", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 54", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 55", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 56", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 57", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product 58", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 59", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 60", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 61", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 62", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 63", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 64", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 65", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 66", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product 67", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 68", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 69", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 70", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 71", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 72", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 73", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 74", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 75", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product 76", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 77", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 78", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 79", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 80", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 81", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 82", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 83", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 84", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product 85", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 86", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 87", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 88", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 89", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 90", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 91", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 92", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 93", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product 94", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 95", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 96", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 97", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 98", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 99", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product a9", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product b0", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product c1", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product d2", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product e3", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product f4", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product g5", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product h6", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product i7", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product j9", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product k0", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product l1", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product m2", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product n3", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product o4", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product p5", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product q6", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product r7", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product s9", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product t0", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product u1", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product v2", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product w3", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product x4", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product y5", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product z6", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product aa7", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 19x", "price": "₹1200", "image": "images/img_11.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 2d0", "price": "₹500", "image": "images/img_10.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 2d1", "price": "₹1200", "image": "images/img_12.jpg", "discount": "20% off", "isLiked": false},
//     {"name": "Product 22d", "price": "₹500", "image": "images/img_6.png", "discount": "10% off", "isLiked": false},
//     {"name": "Product 2s3", "price": "₹1200", "image": "images/img_7.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 24s", "price": "₹500", "image": "images/img11.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 25s", "price": "₹1200", "image": "images/img_8.png", "discount": "20% off", "isLiked": false},
//     {"name": "Product 26s", "price": "₹500", "image": "images/img_12.jpg", "discount": "10% off", "isLiked": false},
//     {"name": "Product 27w", "price": "₹120", "image": "images/img_6.png", "discount": "20% off", "isLiked": false},
//
//   ];
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFavorites();
//   }
//
//   Future<void> _loadFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedFavorites = prefs.getString('productgrid_favorite_products');
//
//     if (savedFavorites != null) {
//       final List<Map<String, dynamic>> favoriteProducts =
//       List<Map<String, dynamic>>.from(jsonDecode(savedFavorites));
//
//       for (var product in expolore2) {
//         product["isLiked"] =
//             favoriteProducts.any((fav) => fav["name"] == product["name"]);
//       }
//     }
//     setState(() {
//       isLoading = false; // Done loading favorites
//     });
//   }
//
//   Future<void> _saveFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final favoriteProducts = [
//       ...expolore2.where((product) => product["isLiked"]),
//
//     ];
//     prefs.setString(
//         'productgrid_favorite_products', jsonEncode(favoriteProducts));
//   }
//
//   void _scrollToSection(int sectionIndex) {
//     setState(() {
//       selectedIndex = sectionIndex;
//     });
//
//     // Calculate the scroll position to align the section at the top
//     double scrollToPosition = sectionIndex * (3 * rowHeight + titleHeight);
//
//     _scrollController.animateTo(
//       scrollToPosition,
//       duration: Duration(milliseconds: 500),
//       curve: Curves.easeOut,
//     );
//   }
//
//   // This method creates the titles and rows, ensuring titles come before items
//   List<Widget> _buildListItems() {
//     List<Widget> items = [];
//     int rowsAdded = 0; // Track the number of rows added
//     int sectionIndex = 0;
//
//     for (int i = 0; i < totalItems; i += itemsPerRow) {
//       // Add the title row after every 3 rows
//       if (rowsAdded % 3 == 0) {
//         String title = sectionIndex < expolore1.length
//             ? expolore1[sectionIndex]['name']
//             : "Section ${sectionIndex + 1}"; // Default title
//
//         items.add(
//           Container(
//             height: titleHeight, // Title height
//             padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   title, // Display the title
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blueAccent, // Stylish color
//                   ),
//                 ),
//                 SizedBox(width: 10), // Add space
//                 Expanded(
//                   child: Divider(
//                     color: Colors.blue,
//                     thickness: 2.0, // Make divider more prominent
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//         sectionIndex++;
//       }
//
//       // Add rows of grid items
//       items.add(
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: List.generate(
//             itemsPerRow,
//                 (index) {
//               int currentIndex = i + index;
//               if (currentIndex >= expolore2.length) return SizedBox.shrink(); // Don't display if index exceeds available items
//
//               final product = expolore2[currentIndex];
//
//               return Expanded(
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DetailScreen(
//                           product: product,
//                           onFavoriteChanged: (updatedProduct) {
//                             setState(() {
//                               product["isLiked"] = updatedProduct["isLiked"];
//                             });
//                             _saveFavorites();
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DetailScreen(
//                             product: product,
//                             onFavoriteChanged: (updatedProduct) {
//                               setState(() {
//                                 product["isLiked"] = updatedProduct["isLiked"];
//                               });
//                               _saveFavorites();
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                     splashColor: Colors.blue.withAlpha(30),
//                     highlightColor: Colors.blue.withAlpha(50),
//                     borderRadius: BorderRadius.circular(16.0),
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircleAvatar(
//                             backgroundImage: AssetImage(product["image"]!),
//                             backgroundColor: Colors.white,
//                             radius: 40, // Set the size of the circle avatar
//                           ),
//                           SizedBox(height: 8.0),
//                           Text(
//                             product["name"]!,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       );
//
//       rowsAdded++;
//     }
//
//     return items;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("GridView with Custom Button Names"),
//       ),
//       body: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Container(
//               width: 11, // Width of the button column
//               color: Colors.blue.shade50, // Set background color for the entire column
//               child: ListView.builder(
//                 controller: _buttonScrollController,
//                 itemCount: expolore1.length, // Number of buttons
//                 itemBuilder: (context, index) {
//                   // Access product data using the expolore1 list
//                   var product = expolore1[index];
//
//                   return Column(
//                     children: [
//                       // Wrap each button with a Card, but with no margin
//                       Card(
//                         margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0), // No vertical margin
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: GestureDetector(
//                           onTap: () => _scrollToSection(index),
//                           child: Container(
//                             width: double.infinity, // Make the button fill the width of the container
//                             height: 100, // Height of each button
//                             decoration: BoxDecoration(
//                               color: selectedIndex == index
//                                   ? Colors.white // Selected button color
//                                   : Colors.blue.shade50,
//                             ),
//                             child: Column(
//                               children: [
//                                 Material(
//                                   color: Colors.transparent,
//                                   child: Container(
//                                     margin: EdgeInsets.all(8.0),
//                                     padding: EdgeInsets.all(8.0),
//                                     decoration: BoxDecoration(
//                                       color: Colors.blue.shade50,
//                                       borderRadius:
//                                       BorderRadius.circular(8.0),
//                                     ),
//                                     child: Image.asset(
//                                       product["image"]!, // Correct reference to image
//                                       width: 50,
//                                       height: 50,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   product["name"], // Correct reference to name
//                                   style: TextStyle(
//                                     fontSize: 12, // Font size for the text
//                                     fontWeight: FontWeight.w600,
//                                     color: selectedIndex == index
//                                         ? Colors.red // Text color for selected button
//                                         : Colors.black87, // Text color for non-selected buttons
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       // Divider with a small height and color to separate buttons
//                       Divider(
//                         color: Colors.grey.shade300, // Divider color
//                         height: 1, // Divider height
//                         thickness: 1, // Thickness of the divider
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Container(
//               color: Colors.white,
//               child: ListView(
//                 controller: _scrollController,
//                 padding: EdgeInsets.all(5.0),
//                 children: _buildListItems(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
///add to cart
// import 'package:flutter/material.dart';
// import 'package:loginappnew/upi23.dart';
// import 'botambar.dart';
//
// class CartItem {
//   final Map<String, dynamic> product;
//   int quantity;
//   String totalPrice;
//
//   CartItem({
//     required this.product,
//     required this.quantity,
//     required this.totalPrice,
//   });
//
//   void updateQuantity(int newQuantity) {
//     quantity = newQuantity;
//     totalPrice = (newQuantity * (product['price'] as num)).toStringAsFixed(2);
//   }
// }
//
// class CartManager {
//   static final CartManager _instance = CartManager._internal();
//
//   CartManager._internal();
//
//   factory CartManager() => _instance;
//
//   final List<CartItem> _cartItems = [];
//
//   List<CartItem> get cartItems => _cartItems;
//
//   void addItem(CartItem item) {
//     final existingIndex = _cartItems.indexWhere(
//           (cartItem) => cartItem.product["name"] == item.product["name"],
//     );
//
//     if (existingIndex != -1) {
//       _cartItems[existingIndex] = item;
//     } else {
//       _cartItems.add(item);
//     }
//   }
//
//   void removeItem(int index) {
//     _cartItems.removeAt(index);
//   }
//
//   void updateItemQuantity(int index, int newQuantity) {
//     if (newQuantity > 0) {
//       _cartItems[index].updateQuantity(newQuantity);
//     } else {
//       removeItem(index);
//     }
//   }
//
//   double get totalCartPrice {
//     return _cartItems.fold(0.0, (sum, item) {
//       double itemPrice;
//       try {
//         // Parse the price as a double if it's a string
//         itemPrice = item.product['price'] is String
//             ? double.parse(
//             (item.product['price'] as String).replaceAll(RegExp(r'[^\d.]'), ''))
//             : item.product['price'] as double;
//       } catch (e) {
//         itemPrice = 0.0; // Fallback in case of invalid data
//       }
//       return sum + (item.quantity * itemPrice);
//     });
//   }
//
// }
//
// class AddToCartScreen extends StatefulWidget {
//   @override
//   _AddToCartScreenState createState() => _AddToCartScreenState();
// }
//
// class _AddToCartScreenState extends State<AddToCartScreen> {
//
//   final CartManager cartManager = CartManager();
//   List<bool> isLoading = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeLoadingState();
//   }
//
//   void _initializeLoadingState() {
//     isLoading = List<bool>.filled(cartManager.cartItems.length, false);
//   }
//
//   Future<void> _updateQuantity(int index, int newQuantity) async {
//     setState(() {
//       isLoading[index] = true; // Start loader for this item
//     });
//
//     try {
//       await Future.delayed(Duration(milliseconds: 5)); // Simulate delay
//       setState(() {
//         cartManager.updateItemQuantity(index, newQuantity);
//       });
//     } finally {
//       // Stop loader irrespective of success or failure
//       setState(() {
//         isLoading[index] = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My Cart"),
//         backgroundColor: Colors.blue,
//         // leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios)),
//       ),
//       body: Container(
//         color: Colors.blueGrey.shade50, // Set the background color of the body content
//         padding: EdgeInsets.all(16.0),
//         child: cartManager.cartItems.isEmpty
//             ? Center(
//           child: Text(
//             "Your cart is empty!",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[700],
//             ),
//           ),
//         )
//             : ListView.builder(
//           itemCount: cartManager.cartItems.length,
//           itemBuilder: (context, index) {
//             final cartItem = cartManager.cartItems[index];
//
//             double price = 0.0;
//             try {
//               price = double.parse(
//                   cartItem.product['price'].replaceAll("₹", "").trim());
//             } catch (e) {
//               price = 0.0;
//             }
//             return Container(
//               margin: EdgeInsets.symmetric(vertical: 8.0),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.white, Colors.blue.withOpacity(0.2)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(color: Colors.blue.withOpacity(0.3), width: 1),
//               ),
//               child: ListTile(
//                 leading: GestureDetector(
//                   onTap: () {
//                     showModalBottomSheet(
//                       context: context,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//                       ),
//                       backgroundColor: Colors.white,
//                       builder: (BuildContext context) {
//                         return Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Handle for bottom sheet
//                               Center(
//                                 child: Container(
//                                   width: 60,
//                                   height: 5,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey[300],
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 20),
//
//                               // Product Image
//                               if (cartItem.product["image"] != null)
//                                 Center(
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Image.asset(
//                                       cartItem.product["image"],
//                                       width: 180,
//                                       height: 180,
//                                       fit: BoxFit.cover,
//                                       errorBuilder: (context, error, stackTrace) {
//                                         return Icon(
//                                           Icons.image_not_supported,
//                                           size: 180,
//                                           color: Colors.grey[400],
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               SizedBox(height: 20),
//
//                               // Product Name
//                               Center(
//                                 child: Text(
//                                   cartItem.product["name"],
//                                   style: TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.blueAccent,
//                                     letterSpacing: 1.2,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               SizedBox(height: 16),
//
//                               // Divider
//                               Divider(
//                                 color: Colors.blueAccent.withOpacity(0.3),
//                                 thickness: 1.5,
//                               ),
//                               SizedBox(height: 16),
//
//                               // Price Row
//                               Row(
//                                 children: [
//                                   Icon(Icons.attach_money, color: Colors.greenAccent, size: 28),
//                                   SizedBox(width: 8),
//                                   Text(
//                                     "Price:",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                   Spacer(),
//                                   Text(
//                                     "${cartItem.product['price']}",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       color: Colors.black54,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 16),
//
//                               // Quantity Row
//                               Row(
//                                 children: [
//                                   Icon(Icons.production_quantity_limits, color: Colors.orangeAccent, size: 28),
//                                   SizedBox(width: 8),
//                                   Text(
//                                     "Quantity:",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                   Spacer(),
//                                   Text(
//                                     "${cartItem.quantity}",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       color: Colors.black54,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 16),
//
//                               // Total Price Row
//                               Row(
//                                 children: [
//                                   Icon(Icons.money_off, color: Colors.redAccent, size: 28),
//                                   SizedBox(width: 8),
//                                   Text(
//                                     "Total Price:",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                   Spacer(),
//                                   Text(
//                                     "₹${(price * cartItem.quantity).toStringAsFixed(2)}",
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 30),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: cartItem.product["image"] != null
//                         ? Image.asset(
//                       cartItem.product["image"],
//                       width: 60,
//                       height: 60,
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) {
//                         return Icon(
//                           Icons.image_not_supported,
//                           size: 60,
//                           color: Colors.grey[400],
//                         );
//                       },
//                     )
//                         : Icon(Icons.image_not_supported, size: 60, color: Colors.grey[400]),
//                   ),
//                 ),
//                 subtitle:Row(
//                   children: [
//                     // Product Details
//                     Expanded(
//                       flex: 2,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: 4),
//                           Text(
//                             cartItem.product["name"],
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             "Price: ${cartItem.product['price']}",
//                             style: TextStyle(fontSize: 14, color: Colors.black54),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             cartItem.product["discount"],
//                             style: TextStyle(
//                               fontSize: 12, // Font size
//                               fontWeight: FontWeight.bold, // Bold text
//                               color: Colors.red.shade700, // Text color to match the background
//                               letterSpacing: 1.0, // Adds some spacing between letters
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       flex: 2,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.remove, color: Colors.redAccent),
//                             onPressed: !isLoading[index]
//                                 ? () {
//                               _updateQuantity(index, cartItem.quantity - 1);
//                             }
//                                 : null,
//                           ),
//                           Expanded(
//                             child: Container(
//
//                               child: Text(
//                                 "${cartItem.quantity}",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.add, color: Colors.green),
//                             onPressed: !isLoading[index]
//                                 ? () {
//                               _updateQuantity(index, cartItem.quantity + 1);
//                             }
//                                 : null,
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     Expanded(
//                       flex: 1,
//                       child: Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           "₹${(cartItem.quantity * price).toStringAsFixed(2)}",  // Calculate total price here
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//
//               ),
//             );
//
//           },
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 80.0,  // Adjust height for better visual balance
//         child: Row(
//           children: [
//             const SizedBox(width: 9,),
//             Expanded(
//               flex: 1,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => botambar(), // Replace with your Home Screen widget
//                     ),
//                   );
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 11.0),  // Padding for the button
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.green, Colors.lightGreen], // Smooth green gradient
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                     ),
//                     borderRadius: BorderRadius.circular(12),  // Rounded corners for button
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.green.withOpacity(0.4),
//                         blurRadius: 8,
//                         spreadRadius: 1,
//                         offset: Offset(0, 4),  // Shadow effect for the home button
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.home,
//                         color: Colors.white,
//                         size: 28,
//                       ),
//                       SizedBox(width: 10),
//                       Text(
//                         "Home",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 9,),
//             Expanded(
//               flex: 2,
//               child: GestureDetector(
//                 onTap: cartManager.totalCartPrice == 0.0
//                     ? null  // Disable the onTap when amount is 0.0
//                     : () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => UPIPaymentScreen(
//                         amount: cartManager.totalCartPrice.toStringAsFixed(2),
//                       ),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),  // Better padding for click area
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.deepOrange, Colors.orange], // Gradient from deep orange to light orange
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                     ),
//                     borderRadius: BorderRadius.circular(12), // Rounded button corners
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.orange.withOpacity(0.5),
//                         blurRadius: 8,
//                         spreadRadius: 1,
//                         offset: Offset(0, 4), // Shadow for the payment button
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.payment,
//                         color: Colors.white,
//                         size: 28,
//                       ),
//                       SizedBox(width: 10),
//                       Text(
//                         "Pay ₹${cartManager.totalCartPrice.toStringAsFixed(2)}",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 9,),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:loginappnew/setting/profile.dart';
// import 'package:loginappnew/utils/const.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:app_settings/app_settings.dart';
//
// import '../new save.dart';
//
// class SettingScreen extends StatefulWidget {
//   const SettingScreen({super.key, required Map product});
//
//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }
//
// class _SettingScreenState extends State<SettingScreen> {
//   SharedPreferences? _preferences; // Change to nullable
//   bool isLogin = false;
//   Future<void> _showLogoutDialog() async {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFFFF7043),
//                   Color(0xFFFF9800),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Icon(
//                   Icons.logout,
//                   size: 50,
//                   color: Colors.white,
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Logout',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Are you sure you want to logout?',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white70,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text(
//                         'Cancel',
//                         style: TextStyle(color: Colors.orange),
//                       ),
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.redAccent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: () {
//                         _preferences?.remove(prefLoginKey);
//                         Navigator.pushNamedAndRemoveUntil(
//                           globalNavigationKey.currentContext!,
//                           routeLoginScreen,
//                           (route) => false,
//                         );
//                       },
//                       child: const Text('Logout'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   XFile? selectedImage; // For storing the selected image
//   String? base64Image; // For storing the base64 encoded image
//
//   final ImagePicker picker = ImagePicker();
//
//   Future<void> _initializePreferences() async {
//     _preferences = await SharedPreferences.getInstance();
//     setState(() {}); // trigger rebuild once the preferences are loaded
//   }
//
//   Future<void> initSharedPreferences() async {
//     _preferences = await SharedPreferences.getInstance();
//     isLogin = _preferences?.getBool('prefLoginKey') ?? false;
//     setState(() {});
//   }
//   Future<void> _saveImageToPreferences(XFile image) async {
//     final prefs = await SharedPreferences.getInstance();
//     List<int> imageBytes = await image.readAsBytes();
//     String base64Image = base64Encode(imageBytes);
//     await prefs.setString(
//         'image', base64Image); // Save the image as base64 string
//   }
//
//   // Delete the image and revert to default
//   Future<void> _deleteImage() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('image'); // Remove the image from SharedPreferences
//     setState(() {
//       base64Image = null; // Clear the stored image in the state
//       selectedImage = null; // Clear the selected image in the state
//     });
//   }
//
//   // Show the image source selector with a delete option
//   void _showImageSourceSelector() {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//       ),
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Wrap(
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.photo_library, color: Colors.orange),
//                 title: const Text('Gallery'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _selectImageFromGallery();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.camera_alt, color: Colors.orange),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _selectImageFromCamera();
//                 },
//               ),
//               // Only show the delete option if an image is already selected
//               if (base64Image != null) ...[
//                 Divider(),
//                 ListTile(
//                   leading: const Icon(Icons.delete, color: Colors.red),
//                   title: const Text('Delete Image'),
//                   onTap: () {
//                     Navigator.pop(context);
//                     _deleteImage(); // Delete the image when tapped
//                   },
//                 ),
//               ],
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   // Image selection from gallery
//   Future<void> _selectImageFromGallery() async {
//     selectedImage =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
//     if (selectedImage != null) {
//       await _saveImageToPreferences(
//           selectedImage!); // Save selected image to preferences
//       setState(() {});
//     }
//   }
//
//   // Image selection from camera
//   Future<void> _selectImageFromCamera() async {
//     selectedImage =
//         await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
//     if (selectedImage != null) {
//       await _saveImageToPreferences(
//           selectedImage!); // Save selected image to preferences
//       setState(() {});
//     }
//   }
//
//   Future<void> _loadImage() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       base64Image = prefs.getString('image');
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     initSharedPreferences();
//     _initializePreferences();
//     _loadImage();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String userName = _preferences?.getString('name') ?? 'Name not set';
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ACCOUNT', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFFF5F5F5),
//               Color(0xFFFFF0E1),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: ListView(
//           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//           children: [
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Stack(
//                       alignment: Alignment.bottomRight,
//                       children: [
//                         CircleAvatar(
//                           radius: 40,
//                           backgroundImage: base64Image != null
//                               ? MemoryImage(base64Decode(base64Image!))
//                               : AssetImage('images/img_13.png')
//                                   as ImageProvider,
//                         ),
//                         Positioned(
//                           bottom: 1,
//                           right: 5,
//                           child: Container(
//                             width: 27, // Adjust the width
//                             height: 27, // Adjust the height
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Colors.black87, // Border color
//                                 width: 2, // Border width
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           right: 10,
//                           left: 45,
//                           top: 43,
//                           child: IconButton(
//                             icon: const Icon(Icons.camera_alt_outlined,
//                                 color: Colors.black87),
//                             iconSize:
//                                 17, // Adjust the icon size to fit inside the smaller container
//                             onPressed: () => _showImageSourceSelector(),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: ListTile(
//                         title: Text(
//                           "$userName",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         trailing: const Icon(Icons.arrow_forward_ios,
//                             color: Colors.orange),
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (BuildContext context) => ProfileScreen(),
//                           ));
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             _buildGroupedCard(),
//             const SizedBox(height: 20),
//             _buildContainerWithOtherOptions(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildGroupedCard() {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 5,
//       color: Colors.white.withOpacity(0.9),
//       child: Column(
//         children: [
//           _buildCardTile('Profile', Icons.person, onTap: () {
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (BuildContext context) => ProfileScreen()));
//           }),
//           Divider(color: Colors.orange.shade300, thickness: 1),
//           _buildCardTile('Saved Items', Icons.bookmark, onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => SaveScreen(),
//               ),
//             );
//           }),
//           Divider(color: Colors.orange.shade300, thickness: 1),
//           _buildCardTile(
//             'Notifications',
//             Icons.notifications,
//             onTap: () =>
//                 AppSettings.openAppSettings(type: AppSettingsType.notification),
//           ),
//         ],
//       ),
//     );
//   }
//   // ListTile(
//   // title: const Text("Notification"),
//   // onTap: () => AppSettings.openAppSettings(type: AppSettingsType.notification),
//   // ),
//
//   Widget _buildContainerWithOtherOptions() {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.8),
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           _buildCardTile('About Us', Icons.info, onTap: () {}),
//           Divider(color: Colors.orange.shade300, thickness: 1),
//           _buildCardTile('Feedback', Icons.feedback,
//               onTap: () =>
//                   //     Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) => Homepage(
//                   //     ),
//                   //   ),
//                   // ),
//                   {}),
//           Divider(color: Colors.orange.shade300, thickness: 1),
//           _buildCardTile(
//             'Logout',
//             Icons.logout,
//             onTap: _showLogoutDialog,
//             color: Colors.red,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCardTile(String title, IconData icon,
//       {required VoidCallback onTap, Color color = Colors.black}) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.orange),
//       title: Text(
//         title,
//         style: TextStyle(
//           color: color,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       trailing: const Icon(Icons.arrow_forward_ios, color: Colors.orange),
//       onTap: onTap,
//     );
//   }
// }
///setting
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:loginappnew/setting/profile.dart';
// import 'package:loginappnew/utils/const.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:app_settings/app_settings.dart';
//
// import '../new save.dart';
//
// class SettingScreen extends StatefulWidget {
//   const SettingScreen({super.key, required Map product});
//
//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }
//
// class _SettingScreenState extends State<SettingScreen> {
//   SharedPreferences? _preferences; // Change to nullable
//   bool isLogin = false;
//   Future<void> _showLogoutDialog() async {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFFFF7043),
//                   Color(0xFFFF9800),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Icon(
//                   Icons.logout,
//                   size: 50,
//                   color: Colors.white,
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Logout',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Are you sure you want to logout?',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white70,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text(
//                         'Cancel',
//                         style: TextStyle(color: Colors.orange),
//                       ),
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.redAccent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: () {
//                         _preferences?.remove(prefLoginKey);
//                         Navigator.pushNamedAndRemoveUntil(
//                           globalNavigationKey.currentContext!,
//                           routeLoginScreen,
//                           (route) => false,
//                         );
//                       },
//                       child: const Text('Logout'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   XFile? selectedImage; // For storing the selected image
//   String? base64Image; // For storing the base64 encoded image
//
//   final ImagePicker picker = ImagePicker();
//
//   Future<void> _initializePreferences() async {
//     _preferences = await SharedPreferences.getInstance();
//     setState(() {}); // trigger rebuild once the preferences are loaded
//   }
//
//   Future<void> initSharedPreferences() async {
//     _preferences = await SharedPreferences.getInstance();
//     isLogin = _preferences?.getBool('prefLoginKey') ?? false;
//     setState(() {});
//   }
//   Future<void> _saveImageToPreferences(XFile image) async {
//     final prefs = await SharedPreferences.getInstance();
//     List<int> imageBytes = await image.readAsBytes();
//     String base64Image = base64Encode(imageBytes);
//     await prefs.setString(
//         'image', base64Image); // Save the image as base64 string
//   }
//
//   // Delete the image and revert to default
//   Future<void> _deleteImage() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('image'); // Remove the image from SharedPreferences
//     setState(() {
//       base64Image = null; // Clear the stored image in the state
//       selectedImage = null; // Clear the selected image in the state
//     });
//   }
//
//   // Show the image source selector with a delete option
//   void _showImageSourceSelector() {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//       ),
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Wrap(
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.photo_library, color: Colors.orange),
//                 title: const Text('Gallery'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _selectImageFromGallery();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.camera_alt, color: Colors.orange),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _selectImageFromCamera();
//                 },
//               ),
//               // Only show the delete option if an image is already selected
//               if (base64Image != null) ...[
//                 Divider(),
//                 ListTile(
//                   leading: const Icon(Icons.delete, color: Colors.red),
//                   title: const Text('Delete Image'),
//                   onTap: () {
//                     Navigator.pop(context);
//                     _deleteImage(); // Delete the image when tapped
//                   },
//                 ),
//               ],
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   // Image selection from gallery
//   Future<void> _selectImageFromGallery() async {
//     selectedImage =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
//     if (selectedImage != null) {
//       await _saveImageToPreferences(
//           selectedImage!); // Save selected image to preferences
//       setState(() {});
//     }
//   }
//
//   // Image selection from camera
//   Future<void> _selectImageFromCamera() async {
//     selectedImage =
//         await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
//     if (selectedImage != null) {
//       await _saveImageToPreferences(
//           selectedImage!); // Save selected image to preferences
//       setState(() {});
//     }
//   }
//
//   Future<void> _loadImage() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       base64Image = prefs.getString('image');
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     initSharedPreferences();
//     _initializePreferences();
//     _loadImage();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String userName = _preferences?.getString('name') ?? 'Name not set';
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ACCOUNT', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFFF5F5F5),
//               Color(0xFFFFF0E1),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: ListView(
//           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//           children: [
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Stack(
//                       alignment: Alignment.bottomRight,
//                       children: [
//                         CircleAvatar(
//                           radius: 40,
//                           backgroundImage: base64Image != null
//                               ? MemoryImage(base64Decode(base64Image!))
//                               : AssetImage('images/img_13.png')
//                                   as ImageProvider,
//                         ),
//                         Positioned(
//                           bottom: 1,
//                           right: 5,
//                           child: Container(
//                             width: 27, // Adjust the width
//                             height: 27, // Adjust the height
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Colors.black87, // Border color
//                                 width: 2, // Border width
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           right: 10,
//                           left: 45,
//                           top: 43,
//                           child: IconButton(
//                             icon: const Icon(Icons.camera_alt_outlined,
//                                 color: Colors.black87),
//                             iconSize:
//                                 17, // Adjust the icon size to fit inside the smaller container
//                             onPressed: () => _showImageSourceSelector(),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: ListTile(
//                         title: Text(
//                           "$userName",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         trailing: const Icon(Icons.arrow_forward_ios,
//                             color: Colors.orange),
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (BuildContext context) => ProfileScreen(),
//                           ));
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             _buildGroupedCard(),
//             const SizedBox(height: 20),
//             _buildContainerWithOtherOptions(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildGroupedCard() {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 5,
//       color: Colors.white.withOpacity(0.9),
//       child: Column(
//         children: [
//           _buildCardTile('Profile', Icons.person, onTap: () {
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (BuildContext context) => ProfileScreen()));
//           }),
//           Divider(color: Colors.orange.shade300, thickness: 1),
//           _buildCardTile('Saved Items', Icons.bookmark, onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => SaveScreen(),
//               ),
//             );
//           }),
//           Divider(color: Colors.orange.shade300, thickness: 1),
//           _buildCardTile(
//             'Notifications',
//             Icons.notifications,
//             onTap: () =>
//                 AppSettings.openAppSettings(type: AppSettingsType.notification),
//           ),
//         ],
//       ),
//     );
//   }
//   // ListTile(
//   // title: const Text("Notification"),
//   // onTap: () => AppSettings.openAppSettings(type: AppSettingsType.notification),
//   // ),
//
//   Widget _buildContainerWithOtherOptions() {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.8),
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           _buildCardTile('About Us', Icons.info, onTap: () {}),
//           Divider(color: Colors.orange.shade300, thickness: 1),
//           _buildCardTile('Feedback', Icons.feedback,
//               onTap: () =>
//                   //     Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) => Homepage(
//                   //     ),
//                   //   ),
//                   // ),
//                   {}),
//           Divider(color: Colors.orange.shade300, thickness: 1),
//           _buildCardTile(
//             'Logout',
//             Icons.logout,
//             onTap: _showLogoutDialog,
//             color: Colors.red,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCardTile(String title, IconData icon,
//       {required VoidCallback onTap, Color color = Colors.black}) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.orange),
//       title: Text(
//         title,
//         style: TextStyle(
//           color: color,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       trailing: const Icon(Icons.arrow_forward_ios, color: Colors.orange),
//       onTap: onTap,
//     );
//   }
// }




