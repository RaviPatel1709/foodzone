import 'package:flutter/material.dart';
import 'botambar.dart';
import 'utils/const.dart';

class getstarted extends StatefulWidget {
  const getstarted({super.key});

  @override
  State<getstarted> createState() => _getstartedState();
}

class _getstartedState extends State<getstarted> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => botambar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 750,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(localImage5),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            top: 50,
            left: 31,
            child: SizedBox(
                width: 350,
                height: 350,
                child: Image(
                    image: AssetImage(
                  localImage6,
                ))),
          ),
          Positioned(
            bottom:250,
            left: 5,
            child: SizedBox(
              width: 400,
              height: 250,
              child: Column(
                children: const [
                  Text(
                    'Wellcome',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          'Cursive',
                      letterSpacing:
                          2.0,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          color: Colors.black54,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'to',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                      'Cursive',
                      letterSpacing:
                      2.0,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          color: Colors.black54,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'foodzone',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                      'Cursive',
                      letterSpacing:
                      2.0,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          color: Colors.black54,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(children: const [
            Positioned(
              top: 650,
              bottom: 1,
              left:1,
              right: 10,
              child: SizedBox(
                width: 700,
                height: 400,
                child:Image(image: AssetImage(localImage2)),
              ),
            ),
          ]),
          // Stack(
          //   children: [
          //     Positioned(
          //       bottom: 70,
          //       left: 101,
          //       child: SizedBox(
          //         width: 201,
          //         child: Card(
          //           color: Color(0xFFFF7043),
          //           child: ElevatedButton(
          //             style: const ButtonStyle(
          //               backgroundColor: MaterialStatePropertyAll(
          //                 Color(0xFFFF7043),
          //               ),
          //               elevation: MaterialStatePropertyAll(22),
          //             ),
          //             onPressed: () {
          //               Navigator.of(context).push(
          //                 MaterialPageRoute(
          //                   builder: (BuildContext context) => homepage(),
          //                 ),
          //               );
          //             },
          //             child: const Text("Get Started",
          //                 style: TextStyle(
          //                     backgroundColor: Color(0xFFFF7043),
          //                     color: Colors.black,
          //                     fontSize: 21)),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
