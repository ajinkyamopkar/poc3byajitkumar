// import 'package:flutter/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:getxbase/Modules/homescreen/newpassword.dart';
import 'package:getxbase/Modules/homescreen/register.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Homescreen> {
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
                      'Sign in',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Hi welcome back, you\'ve been missed!',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF878787)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000)),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      hintText: 'Enter Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigate to the Forget Password page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Newpassword(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff704f38),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                            builder: (context) => const Newpassword()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff704f38),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: const Divider(
                                color: Color(0xFF878787),
                                height: 56,
                              ),
                            ),
                          ),
                          const Text(
                            'Or sign in with',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF878787),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: const Divider(
                                color: Color(0xFF878787),
                                height: 36,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/gp.png',
                              fit: BoxFit.none,
                            ),
                            const SizedBox(width: 20),
                            Image.asset(
                              'assets/images/facebook.png',
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 20),
                            Image.asset(
                              'assets/images/apple.png',
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text.rich(TextSpan(
                        text: 'Dont have an account?  ',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xff704f38),
                              fontSize: 14,
                              color: Color(0xff704f38),
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Register(),
                                  ),
                                );
                              },
                          )
                        ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
