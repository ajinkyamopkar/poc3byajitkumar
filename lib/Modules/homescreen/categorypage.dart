import 'package:flutter/material.dart';

class Categorypage extends StatefulWidget {
  const Categorypage({super.key});

  @override
  State<Categorypage> createState() => _CategoryState();
}

class _CategoryState extends State<Categorypage> {
  // List of items to be displayed in the dropdown
  List<String> listItem = [
    'New york, USA',
    'New york, USA 1',
    'New york, USA 2',
    'New york, USA 3'
  ];

  // Variable to store the selected value from the dropdown
  String? valueChoose;

  // final List<String> imgList = [
  //   'assets/images/banner_bg_1.jpg',
  //   'assets/images/banner_bg_2.jpg',
  //   'assets/images/banner_bg_3.jpg',
  //   'assets/images/banner_bg_4.jpg',
  // ];

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
              const Padding(
                padding: EdgeInsets.only(top: 80.0),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.circle_notifications_rounded,
                      color: Colors.black,
                      size: 49,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.my_location_sharp,
                      color: Colors.black,
                      size: 29,
                    ),
                    const SizedBox(width: 10),
                    // DropdownButton for selecting a location
                    DropdownButton<String>(
                      hint: const Text("New york, USA"),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 38,
                      value: valueChoose,
                      onChanged: (String? newValue) {
                        setState(() {
                          valueChoose = newValue; // Update selected value
                        });
                      },
                      items: listItem.map((String valueItem) {
                        return DropdownMenuItem<String>(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                    // Text displaying the selected location or placeholder text
                    Text(
                      valueChoose ?? 'Select Country',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar with icon inside
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                          // Expanded TextField to fill available space
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                border:
                                    InputBorder.none, // Remove default border
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_sharp,
                              color: Color(0xff704f38),
                              size: 29,
                            ),
                            onPressed: () {
                              // Add your delete logic here
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              // Center(
              //   child: CarouselSlider.builder(
              //     itemCount: imgList.length,
              //     itemBuilder: (context, index, realIndex) {
              //       return Container(
              //         margin: EdgeInsets.symmetric(horizontal: 5.0),
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(10.0),
              //           child: Image.network(
              //             imgList[index],
              //             fit: BoxFit.cover,
              //             width: double.infinity,
              //             height: 200,
              //           ),
              //         ),
              //       );
              //     },
              //     options: CarouselOptions(
              //       autoPlay: true,
              //       enlargeCenterPage: true,
              //       aspectRatio: 16 / 9,
              //       viewportFraction: 0.8,
              //       onPageChanged: (index, reason) {
              //         // Handle page change logic if needed
              //       },
              //     ),
              //   ),
              // ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff704f38),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: 100,
              //   width: 100,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: Colors.blue, // Circle color
              //   ),
              //   child: const Icon(
              //     Icons.person_rounded,
              //     color: Colors.white,
              //     size: 50,
              //   ),
              // ),
              // SingleChildScrollView(
              //   child: Container(
              //     child: SizedBox(
              //       height: 800,
              //       child: GridView.builder(
              //         gridDelegate:
              //             const SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 2, // Number of items per row
              //           crossAxisSpacing: 2.0, // Spacing between columns
              //           mainAxisSpacing: 1.0, // Spacing between rows
              //           mainAxisExtent: 350,
              //           childAspectRatio:
              //               1, // Aspect ratio for each item (width/height)
              //         ),
              //         itemCount: 4, // Number of items in the grid
              //         itemBuilder: (context, index) {
              //           return Container(
              //             // color: Colors.blue,
              //             child: Column(
              //               children: [
              //                 Stack(
              //                   alignment: Alignment.topLeft,
              //                   children: <Widget>[
              //                     // Background Image

              //                     Image.asset(
              //                       "assets/images/pd3.png", // Replace with your image URL
              //                       // width: 197,
              //                       // height: 100,
              //                       fit: BoxFit.cover,
              //                     ),

              //                     // Overlay Image
              //                     Positioned(
              //                       top: 2,
              //                       right: 3,
              //                       child: Image.asset(
              //                         'assets/images/faviourte-like.png', // Replace with your overlay image URL
              //                         width: 40,
              //                       ),
              //                     ),
              //                     // Adjust this value to position the second text

              //                     // Optionally, you can add text as an overlay as well
              //                   ],
              //                 ),
              //                 const Row(
              //                   mainAxisAlignment: MainAxisAlignment
              //                       .spaceAround, // Aligns the row's children with space around
              //                   children: [
              //                     Text(
              //                       'Brown Jacket',
              //                       style: TextStyle(
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.w700,
              //                           color: Color(0xFF000000)),
              //                     ),
              //                     // First Text widget in the row
              //                   ],
              //                 ),
              //                 const Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Icon(
              //                       Icons.star,
              //                       color: Colors.orange,
              //                       size: 24,
              //                     ),

              //                     // Left-aligned text
              //                     Text(
              //                       "4.9",
              //                       style: TextStyle(fontSize: 16),
              //                     ),
              //                     SizedBox(
              //                       width: 30,
              //                     ),
              //                     Icon(
              //                       Icons.location_on,
              //                       color: Colors.orange,
              //                       size: 24,
              //                     ),
              //                     // Right-aligned text
              //                     Text(
              //                       "190m",
              //                       style: TextStyle(fontSize: 16),
              //                     ),
              //                   ],
              //                 ),
              //                 const Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceAround,
              //                   children: [
              //                     Align(
              //                       alignment: Alignment.centerLeft,
              //                       child: Text(
              //                         '17,230',
              //                         style: TextStyle(
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.w700,
              //                           color: Colors.orange,
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 )
              //               ],
              //             ),
              //           );
              //         },
              //       ),
              //     ),
              //   ),
              // ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      'Blue Shirt',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.delete_sharp,
                      color: Color(0xff704f38),
                      size: 29,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Categorypage()),
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

// void main() {
//   runApp(MaterialApp(
//     home: Categorypage(), // Start the app with Categorypage
//   ));
// }

void main() => runApp(MaterialApp(
      home: CarouselExample(),
    ));

CarouselExample() {}
