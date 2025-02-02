// //cloth savee
// import 'package:flutter/material.dart';
// import 'package:loginappnew/setting/saved.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
//
// class ProductGrid extends StatefulWidget {
//   @override
//   _ProductGridState createState() => _ProductGridState();
// }
//
// class _ProductGridState extends State<ProductGrid> {
//   List<Map<String, dynamic>> products = [
//     {
//       "name": "addsa",
//       "price": "₹732",
//       "image": "images/img_7.png",
//       "discount": "79% off",
//       "isLiked": false,
//     },
//     {
//       "name": "Watch",
//       "price": "₹199",
//       "image": "images/img_8.png",
//       "discount": "87% off",
//       "isLiked": false,
//     },
//     {
//       "name": "San",
//       "price": "₹1,749",
//       "image": "images/img_9.png",
//       "discount": "40% off",
//       "isLiked": false,
//     },
//     {
//       "name": "peaker",
//       "price": "₹324",
//       "image": "images/img_10.png",
//       "discount": "78% off",
//       "isLiked": false,
//     },
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFavorites();
//   }
//
//   // Load saved favorites from SharedPreferences
//   Future<void> _loadFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedFavorites = prefs.getString('product_grid_favorite_products');
//     if (savedFavorites != null) {
//       final List<Map<String, dynamic>> favoriteProducts =
//       List<Map<String, dynamic>>.from(jsonDecode(savedFavorites));
//       for (var product in products) {
//         product["isLiked"] =
//             favoriteProducts.any((fav) => fav["name"] == product["name"]);
//       }
//       setState(() {});
//     }
//   }
//
//   // Save the favorites list to SharedPreferences
//   Future<void> _saveFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final favoriteProducts = products.where((product) => product["isLiked"]).toList();
//     prefs.setString('product_grid_favorite_products', jsonEncode(favoriteProducts));
//   }
//
//   // Callback to update the favorite status in ProductGrid
//   void _updateFavorites(List<Map<String, dynamic>> updatedFavorites) {
//     setState(() {
//       products = updatedFavorites;
//     });
//     _saveFavorites();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Grid'),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8.0,
//             mainAxisSpacing: 8.0,
//             childAspectRatio: 0.75,
//           ),
//           itemCount: products.length,
//           itemBuilder: (context, index) {
//             final product = products[index];
//             return ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.zero,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SaveScreen(
//                       favoriteProducts: products.where((product) => product["isLiked"]).toList(),
//                       sourceScreen: 'ProductGrid',
//                       onFavoritesChanged: _updateFavorites, // Pass callback
//                     ),
//                   ),
//                 );
//               },
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
//                       child: Image.asset(
//                         product["image"],
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           product["name"],
//                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           product["price"],
//                           style: TextStyle(fontSize: 14, color: Colors.green),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           product["discount"],
//                           style: TextStyle(fontSize: 12, color: Colors.grey),
//                         ),
//                         SizedBox(height: 8),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: IconButton(
//                             icon: Icon(
//                               product["isLiked"]
//                                   ? Icons.favorite
//                                   : Icons.favorite_border,
//                               color: product["isLiked"] ? Colors.red : Colors.grey,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 product["isLiked"] = !product["isLiked"];
//                               });
//                               _saveFavorites();
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text(
//                                     product["isLiked"]
//                                         ? "Added to favorites!"
//                                         : "Removed from favorites!",
//                                   ),
//                                   duration: Duration(seconds: 1),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// // cloth
// import 'package:flutter/material.dart';
// import 'package:loginappnew/webscreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// import 'package:loginappnew/setting/saved.dart';
//
// import 'detailproduct.dart';
//
// class ProductGrid extends StatefulWidget {
//   @override
//   _ProductGridState createState() => _ProductGridState();
// }
//
// class _ProductGridState extends State<ProductGrid> {
//   List<Map<String, dynamic>> products = [
//     {
//       "name": "addsa",
//       "price": "₹732",
//       "image": "images/img_7.png",
//       "discount": "79% off",
//       "isLiked": false,
//     },
//     {
//       "name": "Watch",
//       "price": "₹199",
//       "image": "images/img_8.png",
//       "discount": "87% off",
//       "isLiked": false,
//     },
//     {
//       "name": "San",
//       "price": "₹1,749",
//       "image": "images/img_9.png",
//       "discount": "40% off",
//       "isLiked": false,
//     },
//     {
//       "name": "peaker",
//       "price": "₹324",
//       "image": "images/img_10.png",
//       "discount": "78% off",
//       "isLiked": false,
//     },
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFavorites();
//   }
//
//   // Load saved favorites from SharedPreferences
//   Future<void> _loadFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedFavorites = prefs.getString('favorite_products');
//
//     if (savedFavorites != null) {
//       final List<Map<String, dynamic>> favoriteProducts =
//       List<Map<String, dynamic>>.from(jsonDecode(savedFavorites));
//       // Update the isLiked state of products based on saved data
//       for (var product in products) {
//         product["isLiked"] =
//             favoriteProducts.any((fav) => fav["name"] == product["name"]);
//       }
//       setState(() {});
//     }
//   }
//
//   Future<void> _saveFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final favoriteProducts = products.where((product) => product["isLiked"]).toList();
//     prefs.setString('product_grid_favorite_products', jsonEncode(favoriteProducts)); // Save using a different key
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Grid'),
//         backgroundColor: Colors.green,
//
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8.0,
//             mainAxisSpacing: 8.0,
//             childAspectRatio: 0.75,
//           ),
//           itemCount: products.length,
//           itemBuilder: (context, index) {
//             final product = products[index];
//             return ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.zero,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onPressed: () {
//                 // Navigate to the ProductDetailScreen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProductDetailScreen(
//                       product: product,
//                     ),
//                   ),
//                 );
//               },
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
//                       child: Image.asset(
//                         product["image"],
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           product["name"],
//                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           product["price"],
//                           style: TextStyle(fontSize: 14, color: Colors.green),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           product["discount"],
//                           style: TextStyle(fontSize: 12, color: Colors.grey),
//                         ),
//                         SizedBox(height: 8),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: IconButton(
//                             icon: Icon(
//                               product["isLiked"]
//                                   ? Icons.favorite
//                                   : Icons.favorite_border,
//                               color: product["isLiked"] ? Colors.red : Colors.grey,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 product["isLiked"] = !product["isLiked"];
//                               });
//                               _saveFavorites();
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text(
//                                     product["isLiked"]
//                                         ? "Added to favorites!"
//                                         : "Removed from favorites!",
//                                   ),
//                                   duration: Duration(seconds: 1),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }