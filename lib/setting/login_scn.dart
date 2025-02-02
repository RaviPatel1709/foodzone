import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:loginappnew/setting/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loginappnew/utils/const.dart';
import 'package:loginappnew/utils/my_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late bool isObscureText;
  bool isLoader = false;
  late SharedPreferences _preferences;
  bool isLogin = false;

  Future initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    isLogin = _preferences.getBool(prefLoginKey) ?? false;
    setState(() {});
  }


  Future _loginAPIUsingDio() async {
    try {
      setState(() => isLoader = true);
      dio.Response response = await Dio().post(
        'https://reqres.in/api/login',
        data: {
          "email": _emailController.text,
          "password": _passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        setState(() => isLoader = false);
        _preferences.setBool(prefLoginKey, true);
        Navigator.pushNamedAndRemoveUntil(
          context,
          routeHomeScreen,
              (route) => false,
        );
      } else {
        setState(() => isLoader = false);
        MySnackBar.showMySnackBar(
          context: context,
          content: 'Something went wrong!',
          backgroundColor: Colors.red,
        );
      }
    } on dio.DioException catch (error) {
      setState(() => isLoader = false);

      String errorMessage = "Something went wrong!";

      // Handle different DioException scenarios
      switch (error.type) {
        case dio.DioExceptionType.connectionTimeout:
          errorMessage = "Connection timed out. Please try again.";
          break;
        case dio.DioExceptionType.receiveTimeout:
          errorMessage = "Server took too long to respond.";
          break;
        case dio.DioExceptionType.sendTimeout:
          errorMessage = "Request timed out. Please check your internet connection.";
          break;
        case dio.DioExceptionType.badResponse:
        // Handle server responses with an error code
          final statusCode = error.response?.statusCode ?? 0;
          final serverMessage = error.response?.data['message'] ?? 'Server error';
          errorMessage = "Error $statusCode: $serverMessage";
          break;
        case dio.DioExceptionType.cancel:
          errorMessage = "Request was cancelled.";
          break;
        case dio.DioExceptionType.connectionError:
          errorMessage = "Unable to connect. Please check your network.";
          break;
        case dio.DioExceptionType.badCertificate:
          errorMessage = "SSL certificate error. Please contact support.";
          break;
        case dio.DioExceptionType.unknown:
          errorMessage = "An unknown error occurred.";
          break;
        default:
          errorMessage = "An unexpected error occurred.";
      }

      // Show the error message in a Snackbar
      MySnackBar.showMySnackBar(
        context: context,
        content: errorMessage,
        backgroundColor: Colors.red,
      );
    }

  }

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
    isObscureText = true;
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF7043), // Lighter shade of orange
                  Color(0xFFFF9800), // Lighter shade of red-orange
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Welcome Back!",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Login to continue",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: "Email Address",
                              prefixIcon: const Icon(Icons.email,
                                  color: Colors.orange),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              filled: true,
                              fillColor: Colors.orange.shade50,
                            ),
                            validator: (value) =>
                                MySnackBar.emailValidator(value),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: isObscureText,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: const Icon(Icons.lock,
                                  color: Colors.orange),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isObscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.orange,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              filled: true,
                              fillColor: Colors.orange.shade50,
                            ),
                            validator: (value) =>
                            value!.isEmpty ? "Enter a password" : null,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 40,
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _loginAPIUsingDio();
                              }
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Forgot password functionality
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: Colors.orange),
                                ),

                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder:
                                      (BuildContext context)=> RegisterScreen()));
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold, // Optional: Make it bold for emphasis
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (isLoader)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// data:  {"email": "eve.holt@reqres.in", "password": "cityslicka"},