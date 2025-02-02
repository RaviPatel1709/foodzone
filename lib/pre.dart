import 'package:flutter/material.dart';
import 'package:loginappnew/setting/horizantal.dart';

class pre extends StatefulWidget {
  const pre({super.key});

  @override
  State<pre> createState() => _preState();
}

class _preState extends State<pre> {
  final List<Map<String, String>> categories = [
    {"icon1": "images/img_7.png", "icon2": "images/img_8.png", "title1": "Image 1", "title2": "Image A"},
    {"icon1": "images/img_10.png", "icon2": "images/img_10.png", "title1": "Image 2", "title2": "Image B"},
    {"icon1": "images/img_9.png", "icon2": "images/img_8.png", "title1": "Image 3", "title2": "Image C"},
    {"icon1": "images/img_7.png", "icon2": "images/img_8.png", "title1": "Image 4", "title2": "Image D"},
    {"icon1": "images/img_7.png", "icon2": "images/img_8.png", "title1": "Image 5", "title2": "Image E"},
    {"icon1": "images/img_7.png", "icon2": "images/img_8.png", "title1": "Image 6", "title2": "Image F"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length, // Number of items in the list
        itemBuilder: (context, index) {
          var category = categories[index];
          return SizedBox(
            child:
           Column(
             children: [
               Row(
                 children: [
                   GestureDetector(
                     onTap: () {
                       // Navigate to the detail screen for title1 (Image 1 to Image 6)
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => DetailScreen(
                             title: category["title1"]!, // Pass the title for Image 1 to Image 6
                           ),
                         ),
                       );
                     },
                     child: SizedBox(
                       height: 97,
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           // Image for the first icon
                           Material(
                             color: Colors.transparent,
                             child: Container(
                               margin: EdgeInsets.all(8.0),
                               padding: EdgeInsets.all(8.0),
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(8.0),
                               ),
                               child: Image.asset(
                                 category["icon1"]!,
                                 width: 50,
                                 height: 50,
                                 fit: BoxFit.cover,
                               ),
                             ),
                           ),
                           // Text below the first image
                           Text(
                             category["title1"]!,
                             style: TextStyle(
                               fontWeight: FontWeight.normal,
                               fontSize: 12,
                               color: Colors.black,
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ],
               ),
               Row(
                 children: [
                   GestureDetector(
                     onTap: () {
                       // Navigate to the detail screen for title2 (Image A to Image F)
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => DetailScreen(
                             title: category["title2"]!, // Pass the title for Image A to Image F
                           ),
                         ),
                       );
                     },
                     child: SizedBox(
                       height: 97,
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           // Image for the second icon
                           Material(
                             color: Colors.transparent,
                             child: Container(
                               margin: EdgeInsets.all(8.0),
                               padding: EdgeInsets.all(8.0),
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(8.0),
                               ),
                               child: Image.asset(
                                 category["icon2"]!,
                                 width: 50,
                                 height: 50,
                                 fit: BoxFit.cover,
                               ),
                             ),
                           ),
                           // Text below the second image
                           Text(
                             category["title2"]!,
                             style: TextStyle(
                               fontWeight: FontWeight.normal,
                               fontSize: 12,
                               color: Colors.black,
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ],
               ),
             ],
           )

          );
            },

      ),
    );
  }
}
