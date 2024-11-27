import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:getxbase/Modules/homescreen/profilesetting.dart';
import 'package:getxbase/main.dart';
import 'package:image_picker/image_picker.dart';

class Complateprofile extends StatefulWidget {
  const Complateprofile({super.key});

  @override
  State<Complateprofile> createState() => _MyWidgetState();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

Future<void> onprofileTapped() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image == null) return;
}

class _MyWidgetState extends State<Complateprofile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _phoneNumber = '';

  bool isPassVisible = true;
  final List<String> _genders = ['Male', 'Female', 'Other'];
  String? _selectedGender;

  // Declare the variable to hold the profile image
  XFile? _profileImage;

  bool _isValidPhoneNumber(String phone) {
    final phoneRegex = RegExp(r'^\+?1?\d{9,15}$');
    return phoneRegex.hasMatch(phone);
  }

  // Function to handle profile picture tap
  Future<void> onProfileTapped() async {
    final ImagePicker picker = ImagePicker();

    // Pick an image from the gallery
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // If the user didn't pick an image, return early
    if (image == null) return;

    // If an image is selected, update the state to display the image
    setState(() {
      _profileImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Complete Your Profile',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Don\'t worry, only you can see your personal data. No one else will be able to see it.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF878787)),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Profile Picture Section
                  GestureDetector(
                    onTap:
                        onProfileTapped, // Trigger the onProfileTapped function
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        image: _profileImage != null
                            ? DecorationImage(
                                image: FileImage(File(_profileImage!.path)),
                                fit: BoxFit.cover,
                              )
                            : null, // If no image selected, show the default background
                      ),
                      child: _profileImage == null
                          ? const Center(
                              child: Icon(
                                Icons.person_rounded,
                                color: Colors.black,
                                size: 35,
                              ),
                            )
                          : null,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000)),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      labelText: 'Enter your name',
                      hintText: 'e.g. John Doe',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      } else if (value.length < 3) {
                        return 'Name must be at least 3 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Phone Number',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000)),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      hintText: 'Enter Phone Number',
                      errorText: _isValidPhoneNumber(_phoneNumber)
                          ? null
                          : 'Please enter a valid phone number',
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        _phoneNumber = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Gender',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000)),
                  ),
                  const SizedBox(height: 5),
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      labelText: 'Select Gender',
                    ),
                    items: _genders.map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedGender = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a gender';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profilesetting()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff704f38),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Complete Profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
