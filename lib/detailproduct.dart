// import 'package:flutter/material.dart';
// import 'package:loginappnew/upi.dart';
//
// class ProductDetailScreen extends StatefulWidget {
//   final Map<String, dynamic> product;
//
//   ProductDetailScreen({required this.product});
//
//   @override
//   _ProductDetailScreenState createState() => _ProductDetailScreenState();
// }
//
// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   late bool isLiked; // Variable to store like status
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize isLiked based on the product's isLiked property
//     isLiked = widget.product["isLiked"] ?? false;
//   }
//
//   // Toggle the like status
//   void _toggleLike() {
//     setState(() {
//       isLiked = !isLiked;
//     });
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           isLiked ? "Added to favorites!" : "Removed from favorites!",
//         ),
//         duration: Duration(seconds: 1),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50], // Light background for modern look
//       appBar: AppBar(
//         title: Text(
//           widget.product["name"],
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//         backgroundColor: Colors.green,
//         elevation: 5,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Product Image Section
//               Center(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 15,
//                         offset: Offset(0, 10),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Image.asset(
//                       widget.product["image"],
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: 300,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//
//               // Product Name and Like Button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     widget.product["name"],
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       isLiked ? Icons.favorite : Icons.favorite_border,
//                       color: isLiked ? Colors.red : Colors.grey,
//                       size: 28,
//                     ),
//                     onPressed: _toggleLike, // Toggle like on press
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//
//               // Product Price
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     widget.product["price"],
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[700],
//                     ),
//                   ),
//                   if (widget.product["discount"] != null)
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 4), // Add padding
//                       decoration: BoxDecoration(
//                         color: Colors.red[50],
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Text(
//                         widget.product["discount"],
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.red,
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//               SizedBox(height: 20),
//
//               // Product Details
//               Text(
//                 "Product Details:",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 "This is a detailed description of the product. Add more engaging and informative content here to attract users.",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black54,
//                   height: 1.5,
//                 ),
//               ),
//               SizedBox(height: 30),
//
//               // "Buy Now" Button with Gradient and Shadow
//               Center(
//                 child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     gradient: LinearGradient(
//                       colors: [Colors.green, Colors.greenAccent],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.green.withOpacity(0.4),
//                         blurRadius: 10,
//                         offset: Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => upiscreen()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.transparent, // Use container's gradient
//                       shadowColor: Colors.transparent,
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                     ),
//                     child: Text(
//                       "Buy Now",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
///
///
///
// import 'package:flutter/material.dart';
// import 'package:loginappnew/upi23.dart';
//
// class ProductDetailScreen extends StatefulWidget {
//   final Map<String, dynamic> product;
//   final Function(Map<String, dynamic>) onFavoriteChanged;
//
//   ProductDetailScreen({required this.product, required this.onFavoriteChanged});
//
//   @override
//   _ProductDetailScreenState createState() => _ProductDetailScreenState();
// }
//
// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   late bool isLiked;
//
//   @override
//   void initState() {
//     super.initState();
//     isLiked = widget.product["isLiked"] ?? false;
//   }
//
//   void _toggleLike() {
//     setState(() {
//       isLiked = !isLiked;
//     });
//     widget.product["isLiked"] = isLiked;
//     widget.onFavoriteChanged(widget.product); // Notify parent widget
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           isLiked ? "Added to favorites!" : "Removed from favorites!",
//         ),
//         duration: Duration(seconds: 1),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         title: Text(
//           widget.product["name"],
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//         backgroundColor: Colors.green,
//         elevation: 5,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 15,
//                         offset: Offset(0, 10),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Image.asset(
//                       widget.product["image"],
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: 300,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     widget.product["name"],
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       isLiked ? Icons.favorite : Icons.favorite_border,
//                       color: isLiked ? Colors.red : Colors.grey,
//                       size: 28,
//                     ),
//                     onPressed: _toggleLike,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "${widget.product["price"]}", // Assuming price is a number
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[700],
//                     ),
//                   ),
//                   if (widget.product["discount"] != null)
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: Colors.red[50],
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Text(
//                         widget.product["discount"],
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.red,
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     gradient: LinearGradient(
//                       colors: [Colors.green, Colors.greenAccent],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.green.withOpacity(0.4),
//                         blurRadius: 10,
//                         offset: Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Pass the product price to UPI payment screen
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => UPIPaymentScreen(
//                             amount: widget.product["price"],
//                           ),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.transparent,
//                       shadowColor: Colors.transparent,
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                     ),
//                     child: Text(
//                       "Buy Now",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
