import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loginappnew/setting/profile.dart';
import 'package:loginappnew/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_settings/app_settings.dart';

import '../new save.dart';
import '../setting/new login,reg.dart';

class SettingScreen extends StatefulWidget {
  const 
  SettingScreen({super.key, required Map product});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SharedPreferences? _preferences; // Change to nullable
  bool isLogin = false;

  Future<void> _logout(BuildContext context) async {
    await secureStorage.delete(key: 'isLoggedIn'); // Login status delete karein
    await secureStorage.delete(key: 'loggedInEmail'); // Email bhi delete karein

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()), // Login screen pe bhejo
          (Route<dynamic> route) => false, // Purane routes remove karo
    );
  }

  Future<void> _showLogoutDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF7043),
                  Color(0xFFFF9800),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.logout,
                  size: 50,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Are you sure you want to logout?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        _preferences?.remove(prefLoginKey);
                        Navigator.pushNamedAndRemoveUntil(
                          globalNavigationKey.currentContext!,
                          routeLoginScreen,
                          (route) => false,
                        );
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(prefLoginKey, false);  // Update login status to false
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()), // Navigate to login screen
    );
  }

  XFile? selectedImage; // For storing the selected image
  String? base64Image; // For storing the base64 encoded image

  final ImagePicker picker = ImagePicker();

  Future<void> _initializePreferences() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {}); // trigger rebuild once the preferences are loaded
  }

  Future<void> initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    isLogin = _preferences?.getBool('prefLoginKey') ?? false;
    setState(() {});
  }
  Future<void> _saveImageToPreferences(XFile image) async {
    final prefs = await SharedPreferences.getInstance();
    List<int> imageBytes = await image.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    await prefs.setString(
        'image', base64Image); // Save the image as base64 string
  }

  // Delete the image and revert to default
  Future<void> _deleteImage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('image'); // Remove the image from SharedPreferences
    setState(() {
      base64Image = null; // Clear the stored image in the state
      selectedImage = null; // Clear the selected image in the state
    });
  }

  // Show the image source selector with a delete option
  void _showImageSourceSelector() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.orange),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _selectImageFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.orange),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _selectImageFromCamera();
                },
              ),
              // Only show the delete option if an image is already selected
              if (base64Image != null) ...[
                Divider(),
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text('Delete Image'),
                  onTap: () {
                    Navigator.pop(context);
                    _deleteImage(); // Delete the image when tapped
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  // Image selection from gallery
  Future<void> _selectImageFromGallery() async {
    selectedImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (selectedImage != null) {
      await _saveImageToPreferences(
          selectedImage!); // Save selected image to preferences
      setState(() {});
    }
  }

  // Image selection from camera
  Future<void> _selectImageFromCamera() async {
    selectedImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (selectedImage != null) {
      await _saveImageToPreferences(
          selectedImage!); // Save selected image to preferences
      setState(() {});
    }
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      base64Image = prefs.getString('image');
    });
  }

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
    _initializePreferences();
    _loadImage();
  }

  @override
  Widget build(BuildContext context) {
    String userName = _preferences?.getString('name') ?? 'Name not set';
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACCOUNT', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF5F5F5),
              Color(0xFFFFF0E1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: base64Image != null
                              ? MemoryImage(base64Decode(base64Image!))
                              : AssetImage('images/img_13.png')
                                  as ImageProvider,
                        ),
                        Positioned(
                          bottom: 1,
                          right: 5,
                          child: Container(
                            width: 27, // Adjust the width
                            height: 27, // Adjust the height
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black87, // Border color
                                width: 2, // Border width
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          left: 45,
                          top: 43,
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt_outlined,
                                color: Colors.black87),
                            iconSize:
                                17, // Adjust the icon size to fit inside the smaller container
                            onPressed: () => _showImageSourceSelector(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "$userName",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Colors.orange),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => ProfileScreen(),
                          ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildGroupedCard(),
            const SizedBox(height: 20),
            _buildContainerWithOtherOptions(),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupedCard() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      color: Colors.white.withOpacity(0.9),
      child: Column(
        children: [
          _buildCardTile('Profile', Icons.person, onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ProfileScreen()));
          }),
          Divider(color: Colors.orange.shade300, thickness: 1),
          _buildCardTile('Saved Items', Icons.bookmark, onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SaveScreen(),
              ),
            );
          }),
          Divider(color: Colors.orange.shade300, thickness: 1),
          _buildCardTile(
            'Notifications',
            Icons.notifications,
            onTap: () =>
                AppSettings.openAppSettings(type: AppSettingsType.notification),
          ),
        ],
      ),
    );
  }
  // ListTile(
  // title: const Text("Notification"),
  // onTap: () => AppSettings.openAppSettings(type: AppSettingsType.notification),
  // ),

  Widget _buildContainerWithOtherOptions() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildCardTile('About Us', Icons.info, onTap: () {}),
          Divider(color: Colors.orange.shade300, thickness: 1),
          _buildCardTile('Feedback', Icons.feedback,
              onTap: () =>
                  //     Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Homepage(
                  //     ),
                  //   ),
                  // ),
                  {}),
          Divider(color: Colors.orange.shade300, thickness: 1),
          _buildCardTile(
            'Logout',
            Icons.logout,
            onTap: () {
              // Show a dialog to confirm the action (Cancel or Logout)
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0), // Rounded corners
                    ),
                    elevation: 6.0, // Shadow for the dialog
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,  // Make the dialog take minimum space
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // Dialog title with a stylish font
                          Text(
                            "Are you sure?",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          // Dialog content
                          Text(
                            "Do you want to logout or cancel the action?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 20.0),
                          // Buttons for Cancel and Logout
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // Cancel Button
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();  // Close the dialog
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.grey[300], // Light gray color for Cancel
                                  onPrimary: Colors.black, // Text color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                ),
                                child: Text("Cancel"),
                              ),
                              // Logout Button
                              ElevatedButton(
                                onPressed: () => _logout(context),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.deepOrangeAccent,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                ),
                                child: Text("Logout"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },


          ),
        ],
      ),
    );
  }

  Widget _buildCardTile(String title, IconData icon,
      {required VoidCallback onTap, Color color = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.orange),
      onTap: onTap,
    );
  }
}
