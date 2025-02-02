import 'package:flutter/material.dart';
import 'package:loginappnew/setting/new%20login,reg.dart';
import 'package:loginappnew/utils/const.dart';
import 'package:loginappnew/getstarted.dart';
import 'package:loginappnew/utils/routs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setting/login_scn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = await checkLoginStatus();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

Future<bool> checkLoginStatus() async {
  SharedPreferences prif = await SharedPreferences.getInstance();
  return prif.getBool(prefLoginKey) ?? false;
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalNavigationKey,
      // theme: ThemeData(
      //   primarySwatch: Colors.orange,
      // ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyAppRouter.generateRoute,
      home: isLoggedIn ? const getstarted() : RegisterScreen(),
    );
  }
}

import 'package:flutter/material.dart';
ā
import 'setting/new login,reg.dart';

void main() => runApp(MyApp());