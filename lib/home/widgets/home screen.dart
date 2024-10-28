import 'package:flutter/material.dart';
import 'package:myoutput/home/widgets/recommended.dart';
import 'package:myoutput/model/place%20model.dart';
import 'package:myoutput/screen/colors.dart';
import 'package:myoutput/screen/detailscreen/detailscreen.dart';
import 'category card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> recommendedImages = [
    "image/city2.jpg",
    "image/city3.jpg",
    "image/city4.jpg",
    "image/city5.jpg",
  ];

  int _selectedIndex = 0; // Track the currently selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat Bubble',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryClr, // Highlight color
        unselectedItemColor: Colors.grey, // Color for unselected items
        onTap: _onItemTapped, // Handle tab changes
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // App bar
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage("image/face.jpg"),
                    ),
                    const SizedBox(width: 15),
                    RichText(
                      text: TextSpan(
                        text: "Hello",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: ", Fanny Face",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Search section
                const SizedBox(height: 15),
                const Text(
                  "Explore new destinations",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Search Your Destination",
                                prefixIcon: Icon(Icons.search),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          const CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.orange,
                            child: Icon(
                              Icons.sort_by_alpha_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Category
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Text(
                      "Category",
                      style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryCard(
                        title: "City",
                        image: "image/city.jpg",
                        gress: () {},
                      ),
                      CategoryCard(
                        title: "Beach",
                        image: "image/city3.jpg",
                        gress: () {},
                      ),
                      CategoryCard(
                        title: "Mountain",
                        image: "image/mountain.jpg",
                        gress: () {},
                      ),
                      CategoryCard(
                        title: "Desert",
                        image: "image/bd.jpg",
                        gress: () {},
                      ),
                    ],
                  ),
                ),

                // Recommended section
                const SizedBox(height: 15),
                const Text(
                  "Recommended",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 15),
                        child: RecommendedCard(
                          placeInfo: places[index],
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(placeInfo: places[index]),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}