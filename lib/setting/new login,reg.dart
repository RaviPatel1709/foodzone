import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../getstarted.dart';

final FlutterSecureStorage secureStorage = FlutterSecureStorage();

String generateKey(String email, String password) {
  return 'likedProducts_${email}_${password.hashCode}';
}

Future<void> storeCredentials(BuildContext context, String email, String password) async {
  if (email.isEmpty || password.isEmpty) {
    print("Error: Email or password cannot be empty");
    return;
  }

  try {
    String? existingData = await secureStorage.read(key: 'credentials');
    List<Map<String, String>> credentialsList = [];

    // If there are existing credentials, decode and check
    if (existingData != null) {
      credentialsList = List<Map<String, String>>.from(jsonDecode(existingData)
          .map((item) => Map<String, String>.from(item)));

      // Check if the email or password already exists
      for (var credential in credentialsList) {
        if (credential['email'] == email) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email is already in use.")),
          );
          return;  // Stop registration if email exists
        }
        if (credential['password'] == password) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Password is already in use.")),
          );
          return;  // Stop registration if password exists
        }
      }
    }

    // If no duplicates, proceed with storing the new credentials
    credentialsList.add({'email': email, 'password': password});
    String updatedData = jsonEncode(credentialsList);
    await secureStorage.write(key: 'credentials', value: updatedData);

    // Initialize liked products as empty list for this email
    await secureStorage.write(
        key: 'likedProducts_$email', value: jsonEncode([]));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Registration successful!")),
    );

    // Navigate to login screen after successful registration
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  } catch (e) {
    print("Error storing credentials: $e");
  }
}

Future<bool> verifyCredentials(String email, String password) async {
  if (email.isEmpty || password.isEmpty) {
    print("Error: Email or password cannot be empty");
    return false;
  }

  try {
    String? storedData = await secureStorage.read(key: 'credentials');
    if (storedData != null) {
      List<Map<String, String>> credentialsList =
      List<Map<String, String>>.from(jsonDecode(storedData)
          .map((item) => Map<String, String>.from(item)));

      for (var credential in credentialsList) {
        if (credential['email'] == email &&
            credential['password'] == password) {
          return true;
        }
      }
    }
  } catch (e) {
    print("Error verifying credentials: $e");
  }
  return false;
}

Future<List<String>> getLikedProducts(String email) async {
  try {
    String? likedProductsData =
    await secureStorage.read(key: 'likedProducts_$email');
    if (likedProductsData != null) {
      return List<String>.from(jsonDecode(likedProductsData));
    }
  } catch (e) {
    print("Error retrieving liked products: $e");
  }
  return [];
}

Future<void> updateLikedProducts(
    String email, List<String> likedProducts) async {
  try {
    await secureStorage.write(
        key: 'likedProducts_$email', value: jsonEncode(likedProducts));
  } catch (e) {
    print("Error updating liked products: $e");
  }
}

class MyApp extends StatelessWidget {
  Future<Widget> _getInitialScreen() async {
    String? isLoggedIn = await secureStorage.read(key: 'isLoggedIn');
    String? email = await secureStorage.read(key: 'loggedInEmail');

    if (isLoggedIn == 'true' && email != null) {
      return getstarted();
    } else {
      return LoginScreen();
    }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getInitialScreen(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: snapshot.data as Widget,
          );
        }
      },
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;
  void _register() async {
    if (_formKey.currentState!.validate()) {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Email and password cannot be empty")),
        );
        return;
      }

      setState(() {
        isLoading = true;
      });

      // Pass context to storeCredentials
      await storeCredentials(context, _emailController.text, _passwordController.text);

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(  // Centering the content inside the container
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,  // Set container width to 90% of screen width
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading text (Welcome message)
               Center(
child: Column(
  children: [
    Text(
      "Welcome To FoodZone",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.orange,  // Orange color for the heading
      ),
      textAlign: TextAlign.center,  // Center the heading text
    ),
    SizedBox(height: 10),
    Text(
      "Please create a new account.",
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[700],
      ),
      textAlign: TextAlign.center,  // Center the subheading text
    ),
    SizedBox(height: 30),
  ],
),
               ),
                  // Email TextFormField
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email, color: Colors.orangeAccent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.orange[50],
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      labelStyle: TextStyle(color: Colors.orangeAccent),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  // Password TextFormField
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Colors.orangeAccent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.orange[50],
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      labelStyle: TextStyle(color: Colors.orangeAccent),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  // Register Button
                  Center(
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _register, // Disable during loading
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                      ),
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Text Button to navigate to Login screen
                  Center(
                    child: TextButton(
                      onPressed: () async {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Already have an account? Log in",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )




    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    String? isLoggedIn = await secureStorage.read(key: 'isLoggedIn');

    if (isLoggedIn == 'true') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => getstarted()),
      );
    }
  }

  void _login() async {
    setState(() {
      isLoading = true;
    });

    bool isValid = await verifyCredentials(
        _emailController.text, _passwordController.text);

    setState(() {
      isLoading = false;
    });

    if (isValid) {
      await secureStorage.write(key: 'isLoggedIn', value: 'true');
      await secureStorage.write(key: 'loggedInEmail', value: _emailController.text);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => getstarted()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid email or password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Please login to your account.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email, color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.orange[50],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock, color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.orange[50],
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text(
                      "Don't have an account? Register",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

