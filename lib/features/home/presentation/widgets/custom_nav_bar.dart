import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  int currentIndex = 0;

  final pages = [
    Center(child: Text("Home Page")),
    Center(child: Text("Stats Page")),
    Center(child: Text("Add Page")), // دي هتشتغل لما يدوس الزائد
    Center(child: Text("Wallet Page")),
    Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => currentIndex = 2);
        },
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 28),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 65,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side
              Row(
                children: [
                  _buildNavItem(Icons.home, 0),
                  SizedBox(width: 30),
                  _buildNavItem(Icons.bar_chart, 1),
                ],
              ),

              // Right side
              Row(
                children: [
                  _buildNavItem(Icons.wallet, 3),
                  SizedBox(width: 30),
                  _buildNavItem(Icons.person, 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = currentIndex == index;

    return InkWell(
      onTap: () => setState(() => currentIndex = index),
      child: Icon(
        icon,
        size: isSelected ? 30 : 26,
        color: isSelected ? Colors.teal : Colors.grey,
      ),
    );
  }
}