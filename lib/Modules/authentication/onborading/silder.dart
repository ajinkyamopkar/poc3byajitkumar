import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:getxbase/Modules/homescreen/register.dart';

class Silder extends StatefulWidget {
  const Silder({super.key});

  @override
  _CarouselWithTextAndArrowsState createState() =>
      _CarouselWithTextAndArrowsState();
}

class _CarouselWithTextAndArrowsState extends State<Silder> {
  int _currentIndex = 2; // To track the current page of the carousel

  final List<Map<String, String>> imgList = [
    {
      'image': 'assets/images/welcome1.png',
      'title': 'Fashion Trend 1',
      'description': 'Explore the latest fashion Explore the latest fashion.',
    },
    {
      'image': 'assets/images/welcome2.png',
      'title': 'Fashion Trend 2',
      'description': 'Discover new styles and looks.',
    },
    {
      'image': 'assets/images/welcome3.png',
      'title': 'Fashion Trend 3',
      'description': 'Stay ahead of the curve .',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            // Navigate to the NextPage when "Skip" is clicked
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Register()),
            );
          },
          child: const Text('Skip'),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            // Carousel slider
            CarouselSlider.builder(
              itemCount: imgList.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        Image.asset(
                          imgList[index]['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 400,
                        ),
                        // Text overlay for the title and description
                        Positioned(
                          bottom: 180,
                          left: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                imgList[index]['title']!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                imgList[index]['description']!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 660.0, // Carousel height
                initialPage: 0,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: false, // Disable autoPlay for manual control
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                viewportFraction: 1,
                aspectRatio: 10 / 9,
              ),
            ),

            // Left Arrow
            Positioned(
              left: 10,
              bottom: 95,
              child: IconButton(
                icon: const Icon(Icons.arrow_left, color: Colors.black, size: 50),
                onPressed: () {
                  setState(() {
                    _currentIndex =
                        (_currentIndex - 1 + imgList.length) % imgList.length;
                  });
                },
              ),
            ),

            // Right Arrow
            Positioned(
              right: 10,
              bottom: 95,
              child: IconButton(
                icon: const Icon(Icons.arrow_right, color: Colors.black, size: 50),
                onPressed: () {
                  setState(() {
                    _currentIndex = (_currentIndex + 1) % imgList.length;
                  });
                },
              ),
            ),

            // Dots indicator
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: Row(
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => setState(() {
                      _currentIndex = entry.key;
                    }),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == entry.key
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
