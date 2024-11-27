// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getxbase/Modules/homescreen/complateprofile.dart';
// import 'package:get/get.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Newpassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassVisible = true;

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
                      'New Password',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'your new password must be different \n from previously used passwords',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF878787)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000)),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isPassVisible,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      hintText: 'Enter Password',
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
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Confirm Password',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000)),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isPassVisible,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      hintText: 'Enter Confirm Password',
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
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    // onPressed: () {
                    //   // if (_formKey.currentState?.validate() ?? false) {
                    //   //   // Perform registration logic
                    //   // }
                    // },
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Complateprofile()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff704f38),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Create New Password',
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
