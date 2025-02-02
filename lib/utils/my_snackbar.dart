import 'package:flutter/material.dart';

class MySnackBar {

  static showMySnackBar({
    required BuildContext context,
    required String content,
    Color? backgroundColor,
    SnackBarAction? action,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: backgroundColor ?? Colors.black,
      duration: const Duration(seconds: 4),
      // showCloseIcon: true,
      // closeIconColor: Colors.red,
      action: action,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.none,
      elevation: 5,
    ));
  }

  static emailValidator(value) {
    if (value == null || value == '') {
      return "Enter an Email";
    }
    else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Enter a valid email';
    }
    else {
      return null;
    }
  }

  static InputDecoration commonInputDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 2,
      ),
    ),
    labelText: "Enter Email",
    labelStyle: const TextStyle(
      color: Colors.blue,
    ),
    prefixIcon: const Icon(
      Icons.email,
      color: Colors.blue,
    ),
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
  );
}
