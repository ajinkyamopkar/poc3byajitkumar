import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getxbase/Modules/homescreen/setting.dart';
import 'package:image_picker/image_picker.dart';

class Profiledetails extends StatefulWidget {
  const Profiledetails({super.key});

  @override
  State<Profiledetails> createState() => _CategoryState();
}

final _formKeyss = GlobalKey<FormState>();

String name = '';
DateTime? dateOfBirth;
String? gender;
String phone = '';
String email = '';

class _CategoryState extends State<Profiledetails> {
  File? _image; // To hold the selected image

  final ImagePicker _picker = ImagePicker();

  // Future<void> _pickImage(ImageSource source) async {
  //   final pickedFile = await _picker.getImage(source: source);

  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/back-left-icon.png',
                            width: 25,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 100),
                    const Text(
                      'Personal Date',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display the selected image
                    _image == null
                        ? const Text('No image selected.')
                        : Image.file(
                            _image!,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                    const SizedBox(height: 20),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     _pickImage(ImageSource.gallery);
                    //   },
                    //   child: Text('Select from Gallery'),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     _pickImage(ImageSource.camera);
                    //   },
                    //   child: Text('Take a Photo'),
                    // ),
                  ],
                ),
              ),
              Form(
                key: _formKeyss,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Full Name',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF000000)),
                      ),
                      const SizedBox(height: 10),
                      // Name Field
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Set the border radius here
                            borderSide: const BorderSide(
                              color: Color(
                                  0xFFd6d6d6), // Customize the border color
                              width: 1.0, // Customize the border width
                            ),
                          ),
                          hintText: 'Enter Your Full Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Full Name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Date of birth',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF000000)),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Set the border radius here
                            borderSide: const BorderSide(
                              color: Color(
                                  0xFFd6d6d6), // Customize the border color
                              width: 1.0, // Customize the border width
                            ),
                          ),
                          hintText: 'Enter Your Date of birth',
                        ),
                        readOnly: true,
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: dateOfBirth ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            setState(() {
                              dateOfBirth = date;
                            });
                          }
                        },
                        validator: (value) {
                          if (dateOfBirth == null) {
                            return 'Please select your date of birth';
                          }
                          return null;
                        },
                        controller: TextEditingController(
                          text: dateOfBirth != null
                              ? "${dateOfBirth!.day}/${dateOfBirth!.month}/${dateOfBirth!.year}"
                              : '',
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Gender',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF000000)),
                      ),
                      const SizedBox(height: 10.0),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Set the border radius here
                            borderSide: const BorderSide(
                              color: Color(
                                  0xFFd6d6d6), // Customize the border color
                              width: 1.0, // Customize the border width
                            ),
                          ),
                          hintText: 'Select Gender',
                        ),
                        value: gender,
                        items: <String>['Male', 'Female', 'Other']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
                      const Text(
                        'Phone',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF000000)),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Set the border radius here
                            borderSide: const BorderSide(
                              color: Color(
                                  0xFFd6d6d6), // Customize the border color
                              width: 1.0, // Customize the border width
                            ),
                          ),
                          hintText: 'Enter your Phone',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            phone = value;
                          });
                        },
                      ),
                      // Email Field
                      const SizedBox(height: 10.0),
                      const Text(
                        'Email',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF000000)),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Set the border radius here
                            borderSide: const BorderSide(
                              color: Color(
                                  0xFFd6d6d6), // Customize the border color
                              width: 1.0, // Customize the border width
                            ),
                          ),
                          hintText: 'Enter your Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // Submit Button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKeyss.currentState!.validate()) {
                            // Process data if the form is valid
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            // You can send the data to the server or process it as needed
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.all(16.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Find by Category',
              //         style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w600,
              //           color: Colors.black,
              //         ),
              //       ),
              //       Text(
              //         'See Allaa',
              //         style: TextStyle(
              //           fontSize: 14,
              //           color: Color(0xffFE8C00),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Setting()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFE8C00),
                  minimumSize: const Size(350, 0),
                  alignment: Alignment.bottomCenter,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Profiledetails(),
  ));
}
