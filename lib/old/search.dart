// import 'package:flutter/material.dart';
//
// import 'explore.dart';
// import 'whats on you mind.dart';
//
// class SearchScreen1 extends StatefulWidget {
//   @override
//   _SearchScreen1State createState() => _SearchScreen1State();
// }
//
// class _SearchScreen1State extends State<SearchScreen1> {
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
//
//   List<String> filteredItems = [];
//   TextEditingController searchController = TextEditingController();
//   FocusNode searchFocusNode = FocusNode();
//   Color borderColor = Colors.grey;
//
//   @override
//   void initState() {
//     super.initState();
//     filteredItems = [];
//
//     // Automatically focus the search bar when the screen opens
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       FocusScope.of(context).requestFocus(searchFocusNode);
//     });
//
//     // Listen to search input
//     searchController.addListener(() {
//       filterSearchResults(searchController.text);
//     });
//
//     searchFocusNode.addListener(() {
//       setState(() {
//         borderColor = searchFocusNode.hasFocus ? Colors.blue : Colors.grey;
//       });
//     });
//   }
//
//   void filterSearchResults(String query) {
//     if (query.isEmpty) {
//       setState(() {
//         filteredItems = [];
//       });
//     } else {
//       setState(() {
//         filteredItems = allItems
//             .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     searchFocusNode.dispose();
//     searchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.white, Colors.white],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 10,
//                       spreadRadius: 2,
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.search,
//                       color: searchController.text.isNotEmpty ||
//                           searchFocusNode.hasFocus
//                           ? Colors.black87
//                           : Colors.black,
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: TextField(
//                         controller: searchController,
//                         focusNode: searchFocusNode,
//                         decoration: InputDecoration(
//                           hintText: 'Search...',
//                           hintStyle: TextStyle(color: Colors.black87),
//                           border: InputBorder.none,
//                         ),
//                         style: TextStyle(color: Colors.black87, fontSize: 16),
//                       ),
//                     ),
//                     if (searchController.text.isNotEmpty ||
//                         searchFocusNode.hasFocus)
//                       IconButton(
//                         icon: Icon(Icons.clear),
//                         onPressed: () {
//                           searchController.clear();
//                           filterSearchResults('');
//                         },
//                         color: Colors.black87,
//                       ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           backgroundColor: Colors.deepOrangeAccent, // To remove default color
//           toolbarHeight: 90,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: filteredItems.isNotEmpty
//                     ? ListView.builder(
//                   itemCount: filteredItems.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       margin: EdgeInsets.symmetric(vertical: 8.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       elevation: 5,
//                       child: ListTile(
//                         contentPadding: EdgeInsets.all(16),
//                         title: Text(
//                           filteredItems[index],
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.blueAccent,
//                           ),
//                         ),
//                         leading: Icon(
//                           Icons.local_grocery_store,
//                           color: Colors.deepOrangeAccent,
//                         ),
//                         trailing: Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.blueAccent,
//                         ),
//                         onTap: () {
//                           List<String> homeScreenItems = [
//                             "Apple",
//                             "Banana",
//                             "Date",
//                             "Eggfruit"
//                           ];
//                           if (homeScreenItems
//                               .contains(filteredItems[index])) {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => ProductGrid(),
//                               ),
//                             );
//                           } else {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     ItemDetailScreen(item: filteredItems[index]),
//                               ),
//                             );
//                           }
//                         },
//                       ),
//                     );
//                   },
//                 )
//                     : Center(
//                   child: Text(
//                     searchController.text.isEmpty
//                         ? 'Type something to search'
//                         : 'No results found',
//                     style: TextStyle(fontSize: 18, color: Colors.black87),
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
//
// class ItemDetailScreen extends StatelessWidget {
//   final String item;
//
//   ItemDetailScreen({required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(item),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Center(
//         child: Text(
//           'Details for $item',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
