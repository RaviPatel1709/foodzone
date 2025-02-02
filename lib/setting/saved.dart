// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
//
// class SaveScreen extends StatefulWidget {
//   final List<Map<String, dynamic>> favoriteProducts;
//   final String sourceScreen;
//   final Function(List<Map<String, dynamic>>) onFavoritesChanged;
//
//   SaveScreen({
//     required this.favoriteProducts,
//     required this.sourceScreen,
//     required this.onFavoritesChanged,
//   });
//
//   @override
//   _SaveScreenState createState() => _SaveScreenState();
// }
//
// class _SaveScreenState extends State<SaveScreen> {
//   late List<Map<String, dynamic>> displayedFavorites;
//
//   @override
//   void initState() {
//     super.initState();
//     displayedFavorites = List.from(widget.favoriteProducts);
//   }
//
//   Future<void> _saveFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (widget.sourceScreen == 'Home') {
//       prefs.setString('home_favorite_products', jsonEncode(displayedFavorites)); // Save from Home
//     } else {
//       prefs.setString('product_grid_favorite_products', jsonEncode(displayedFavorites)); // Save from Product Grid
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Saved Products'),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8.0,
//             mainAxisSpacing: 8.0,
//             childAspectRatio: 0.75,
//           ),
//           itemCount: displayedFavorites.length,
//           itemBuilder: (context, index) {
//             final product = displayedFavorites[index];
//
//             return Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               elevation: 5,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.pop(context, product); // Return selected product to previous screen
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(8.0),
//                         child: Image.asset(
//                           product["image"],
//                           width: double.infinity,
//                           height: 120,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         product["name"],
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         product["price"],
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.green,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         product["discount"],
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       Spacer(),
//                       // Save/Unsave functionality (toggle the like status)
//                       IconButton(
//                         icon: Icon(
//                           product["isLiked"] ? Icons.favorite : Icons.favorite_border,
//                           color: product["isLiked"] ? Colors.red : Colors.grey,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             product["isLiked"] = !product["isLiked"];
//                           });
//                           widget.onFavoritesChanged(displayedFavorites); // Notify ProductGrid of the change
//                           _saveFavorites(); // Save the updated list after toggle
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
