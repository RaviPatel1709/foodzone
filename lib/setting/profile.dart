import 'dart:convert'; // For base64 encoding
import 'dart:io'; // For File handling
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  // Variables to store image and its base64 encoded version
  XFile? selectedImage;
  String? base64Image;

  final ImagePicker picker = ImagePicker(); // Instance for image picking

  // Validates that all text fields have values
  bool _areFieldsValid() {
    return nameController.text.trim().isNotEmpty &&
        addressController.text.trim().isNotEmpty &&
        phoneController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        genderController.text.trim().isNotEmpty &&
        pincodeController.text.trim().isNotEmpty &&
        cityController.text.trim().isNotEmpty &&
        stateController.text.trim().isNotEmpty;
  }

  // Save profile data into shared preferences
  Future<void> _saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text.trim());
    await prefs.setString('address', addressController.text.trim());
    await prefs.setString('phone', phoneController.text.trim());
    await prefs.setString('email', emailController.text.trim());
    await prefs.setString('gender', genderController.text.trim());
    await prefs.setString('pincode', pincodeController.text.trim());
    await prefs.setString('city', cityController.text.trim());
    await prefs.setString('state', stateController.text.trim());
  }

  // Load profile data from shared preferences
  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name') ?? '';
      addressController.text = prefs.getString('address') ?? '';
      phoneController.text = prefs.getString('phone') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      genderController.text = prefs.getString('gender') ?? '';
      pincodeController.text = prefs.getString('pincode') ?? '';
      cityController.text = prefs.getString('city') ?? '';
      stateController.text = prefs.getString('state') ?? '';
    });
  }

  // Initialize by loading profile data and image
  @override
  void initState() {
    super.initState();
    _loadProfileData();
    _loadImage();
  }

  // Load image from shared preferences
  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      base64Image = prefs.getString('image');
    });
  }

  // Save selected image in shared preferences as base64 string
  Future<void> _saveImageToPreferences(XFile image) async {
    final prefs = await SharedPreferences.getInstance();
    List<int> imageBytes = await image.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    await prefs.setString('image', base64Image);
  }

  // Delete the image from shared preferences
  Future<void> _deleteImage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('image');
    setState(() {
      base64Image = null;
      selectedImage = null;
    });
  }

  // Show image source options (Camera or Gallery)
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
              if (base64Image != null) ...[
                Divider(),
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text('Delete Image'),
                  onTap: () {
                    Navigator.pop(context);
                    _deleteImage();
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  // Select image from gallery
  Future<void> _selectImageFromGallery() async {
    selectedImage = await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (selectedImage != null) {
      await _saveImageToPreferences(selectedImage!);
      setState(() {});
    }
  }

  // Select image using camera
  Future<void> _selectImageFromCamera() async {
    selectedImage = await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (selectedImage != null) {
      await _saveImageToPreferences(selectedImage!);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Profile'),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              if (_areFieldsValid()) {
                await _saveProfileData();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile Saved Successfully!')),
                );
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fill all fields!')),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: base64Image != null
                        ? MemoryImage(base64Decode(base64Image!))
                        : AssetImage('images/img_13.png') as ImageProvider,
                  ),
                  Positioned(
                    bottom: 1,
                    right: 5,
                    child: Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black87,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    left: 45,
                    top: 43,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt_outlined, color: Colors.black87),
                      iconSize: 17,
                      onPressed: () => _showImageSourceSelector(),
                    ),
                  ),
                ],
              ),
            ),
            _buildTextField('Name', nameController, Icons.person),
            SizedBox(height: 20),
            _buildTextField('Address', addressController, Icons.home),
            SizedBox(height: 20),
            _buildTextField('Phone Number', phoneController, Icons.phone, isNumber: true),
            SizedBox(height: 20),
            _buildTextField('Email', emailController, Icons.email),
            SizedBox(height: 20),
            _buildTextField('Gender', genderController, Icons.person_outline),
            SizedBox(height: 20),
            _buildTextField('Pincode', pincodeController, Icons.pin, isNumber: true),
            SizedBox(height: 20),
            _buildTextField('City', cityController, Icons.location_city),
            SizedBox(height: 20),
            _buildTextField('State', stateController, Icons.map),
          ],
        ),
      ),
    );
  }

  // Helper method to build text fields
  Widget _buildTextField(String label, TextEditingController controller, IconData icon, {bool isNumber = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.deepOrange),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
