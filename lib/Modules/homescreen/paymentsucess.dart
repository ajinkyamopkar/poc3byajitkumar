import 'package:flutter/material.dart';
import 'package:getxbase/Modules/homescreen/categorypage.dart';

class Paymentsucess extends StatefulWidget {
  const Paymentsucess({super.key});

  @override
  State<Paymentsucess> createState() => _CategoryState();
}

class _CategoryState extends State<Paymentsucess> {
  bool isPushNotificationEnabled = false;
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
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align the row items to start
                  children: [
                    // Back button (on the left)
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

                    // Spacer to push the 'Profile' text to the center
                    const Spacer(),

                    // Profile Text (centered)
                    const Text(
                      'Payment',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),

                    // Spacer to keep the space evenly distributed
                    const Spacer(),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  // Use spaceBetween for consistency
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'Recent',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    // Wrap the English text and icon in a Row
                    Spacer(),
                    // Add some spacing between text and icon
                    Text(
                      'Clear All',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // Space after the bordered column
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 1, // Height of the border line
                  color: const Color(0xffdfdfdf), // Color of the border line
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  // Use spaceBetween for consistency
                  children: [
                    Text(
                      'Blue Shirt',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    // Wrap the English text and icon in a Row
                    Spacer(),
                    // Add some spacing between text and icon
                    Icon(
                      Icons.delete_sharp,
                      color: Color(0xff704f38), // Change color
                      size: 29, // Change size (optional)
                    ),
                  ],
                ),
              ),
              // Space after the bordered column

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Categorypage()),
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
    home: SearchBar(),
  ));
}
