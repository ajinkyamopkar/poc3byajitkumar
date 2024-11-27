import 'package:flutter/material.dart';
import 'package:get/get.dart'; // You are importing Get, but we will keep it for future usage.
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key
  bool isPassVisible = true;
  bool isChecked = false;
  bool isLoading = false; // Variable to show loading indicator

  void registerUser() async {
    if (isChecked) {
      setState(() {
        isLoading = true; // Show loading indicator
      });

      var url = "http://fashionapp.idealake.com/api/user/signup";
      var data = {
        "email": email.text,
        "name": name.text,
        "password": pass.text,
      };
      var bodyy = json.encode(data);
      var urlParse = Uri.parse(url);

      try {
        http.Response response = await http.post(
          urlParse,
          body: bodyy,
          headers: {"Content-Type": "application/json"},
        );

        setState(() {
          isLoading = false; // Hide loading indicator
        });

        // Handle the response
        if (response.statusCode == 200) {
          var dataa = jsonDecode(response.body);
          print("Registration Success: $dataa");
          // Display success message or navigate to another page
          Get.snackbar('Success', 'Registration Successful',
              snackPosition: SnackPosition.BOTTOM);
        } else {
          print("Failed to register: ${response.statusCode}");
          // Display error message if the registration fails
          Get.snackbar('Error', 'Registration failed. Please try again.',
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        print("Error: $e");
        // Display error message for network issues
        Get.snackbar('Error', 'Something went wrong. Please try again.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      // If the checkbox is not checked, show an alert
      Get.snackbar('Error', 'Please agree to the terms and conditions',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Create Account.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        'Fill your information now or register \nwith your social account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF878787),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF878787),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        hintText: 'Enter Your Email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF878787),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        hintText: 'Enter Your Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF878787),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: pass,
                      obscureText: isPassVisible,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        hintText: 'Enter Your Password',
                        suffixIcon: IconButton(
                          icon: Icon(isPassVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isPassVisible = !isPassVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            activeColor: const Color(0xff704f38),
                            checkColor: Colors.white,
                          ),
                          const Center(
                            child: Text.rich(TextSpan(
                              text: 'Agree with  ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff704f38),
                                    fontSize: 14,
                                    color: Color(0xff704f38),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          registerUser();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff704f38),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
