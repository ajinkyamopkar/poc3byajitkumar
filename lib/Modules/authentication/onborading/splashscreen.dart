import 'dart:async';
import 'package:flutter/material.dart';
import 'package:getxbase/Modules/authentication/onborading/silder.dart';
// import 'package:getxbase/Modules/homescreen/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to Homescreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Silder()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color for splash
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png', // Make sure this is the correct image path
              width: 197,
              height: 56,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
