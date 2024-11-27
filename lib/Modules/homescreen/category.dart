import 'package:flutter/material.dart';
import 'package:getxbase/Modules/homescreen/categoryDetails.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

// class _Category extends State<Category> {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Bottom Navigation Example"),
//       ),
//       // body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex, // This will control which tab is active
//         onTap: _onItemTapped, // This calls the _onItemTapped function
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

class _CategoryState extends State<Category> {
  int _currentIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    const Center(child: Text("Home Screen")),
    const Center(child: Text("Search Screen")),
    const Center(child: Text("Profile Screen")),
  ];

  // Method to handle navigation changes
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, // This controls which tab is active
          onTap: _onItemTapped, // This calls the _onItemTapped function
          showSelectedLabels: false, // Hides selected label
          showUnselectedLabels: false, // Hides unselected labels
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home', // Label is required
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '', // Label is required
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '', // Label is required
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user),
              label: '', // Label is required
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/food-banner.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 120, left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_on, color: Colors.white),
                              SizedBox(width: 8.0),
                              Text(
                                'New York City',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/search.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(1.0),
                                child: Image.asset(
                                  'assets/images/notification.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 340,
                          padding: const EdgeInsets.all(15.0),
                          child: const Column(
                            children: <Widget>[
                              Text(
                                'Provide the best food for you',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Find by Category',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffFE8C00),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Wrap the category items inside Containers to apply background color
                      Container(
                        width: 70,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(
                              0xFFFF8C00), // Background color for Burgers
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                        ), // Background color for Burgers
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/burger.png",
                              width: 44, // Adjust width as needed
                              height: 44, // Adjust height as needed
                            ),
                            const Text(
                              "Burger",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20), // Space between items
                      Container(
                        width: 70,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(
                              0xFFFF8C00), // Background color for Burgers
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                        ),
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/taco.png",
                              width: 40,
                              height: 40,
                            ),
                            const Text(
                              "Taco",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 70,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(
                              0xFFFF8C00), // Background color for Burgers
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                        ),
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/drink.png",
                              width: 40,
                              height: 40,
                            ),
                            const Text(
                              "Drink",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 70,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(
                              0xFFFF8C00), // Background color for Burgers
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                        ),
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/pizza.png",
                              width: 40,
                              height: 40,
                            ),
                            const Text(
                              "Pizza",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 70,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(
                              0xFFFF8C00), // Background color for Burgers
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                        ),
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/taco.png",
                              width: 40,
                              height: 40,
                            ),
                            const Text(
                              "Taco",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: 70,
                          height: 90,
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFFFF8C00), // Background color for Burgers
                            borderRadius:
                                BorderRadius.circular(15), // Rounded corners
                          ),
                          // padding: EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/drink.png",
                                width: 40,
                                height: 40,
                              ),
                              const Text(
                                "Drinks",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
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
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of items per row
                    crossAxisSpacing: 1.0, // Spacing between columns
                    mainAxisSpacing: 1.0, // Spacing between rows
                    mainAxisExtent: 200,
                    childAspectRatio:
                        1, // Aspect ratio for each item (width/height)
                  ),
                  itemCount: 4, // Number of items in the grid
                  itemBuilder: (context, index) {
                    return Container(
                      // color: Colors.blue,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.topLeft,
                            children: <Widget>[
                              // Background Image

                              Image.asset(
                                "assets/images/burger1.png", // Replace with your image URL
                                // width: 197,
                                // height: 100,
                                fit: BoxFit.cover,
                              ),

                              // Overlay Image
                              Positioned(
                                top: 2,
                                right: 3,
                                child: Image.asset(
                                  'assets/images/faviourte-like.png', // Replace with your overlay image URL
                                  width: 40,
                                ),
                              ),
                              // Adjust this value to position the second text

                              // Optionally, you can add text as an overlay as well
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceAround, // Aligns the row's children with space around
                            children: [
                              Text(
                                'Ordinary Burgers',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF000000)),
                              ),
                              // First Text widget in the row
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 24,
                              ),

                              // Left-aligned text
                              Text(
                                "4.9",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                Icons.location_on,
                                color: Colors.orange,
                                size: 24,
                              ),
                              // Right-aligned text
                              Text(
                                "190m",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '17,230',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Categorydetails()),
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
