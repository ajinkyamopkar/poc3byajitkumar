import 'package:flutter/material.dart';
import 'package:getxbase/Modules/homescreen/register.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
void main() => runApp(const MyApp());

// Main app widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PCO3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Register(),
    );
  }
}
