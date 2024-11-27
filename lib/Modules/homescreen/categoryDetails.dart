import 'package:flutter/material.dart';
import 'package:getxbase/Modules/homescreen/mycart.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';

class Categorydetails extends StatefulWidget {
  const Categorydetails({super.key});

  @override
  State<Categorydetails> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Categorydetails> {
  int number = 0; // Initialize number

  void incrementNumber() {
    setState(() {
      number += 1;
    });
  }

  void decrementNumber() {
    if (number > 0) {
      setState(() {
        number -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/banner-burger.png',
      'assets/images/banner-burger.png',
      'assets/images/banner-burger.png',
    ];

    return Scaffold(
      appBar: AppBar(
          // title: const Text('Category Details'),
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  aspectRatio: 30 / 2,
                  onPageChanged: (index, reason) {
                    // You can perform some action when the page changes
                    print('Current page: $index');
                  },
                ),
                items: imgList
                    .map((item) => Container(
                          child: Center(
                            child: Image.asset(item,
                                fit: BoxFit.cover, width: 1000),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Burger With Meat',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '\$ 12,230',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFE8C00),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 24,
                  ),
                  Text(
                    'Free Delivery',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF878787),
                    ),
                  ),
                  SizedBox(width: 40),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 24,
                  ),
                  Text(
                    '20 - 30',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF878787),
                    ),
                  ),
                  SizedBox(width: 40),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 24,
                  ),
                  Text(
                    '4.5',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF878787),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF101010),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Burger With Meat is a typical food from our restaurant that is much in demand by many people. This is highly recommended for you.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF878787),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: decrementNumber,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          elevation: 0,
                        ),
                        child: const Text(
                          '-',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        ' $number',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: incrementNumber,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          elevation: 0,
                        ),
                        child: const Text(
                          '+',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    ' \$ 24,460',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xffFE8C00),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Mycart(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFE8C00),
                  minimumSize: const Size(350, 0),
                  alignment: Alignment.center,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        ' Add to Cart',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
    home: Categorydetails(),
  ));
}
