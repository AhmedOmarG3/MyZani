import 'package:flutter/material.dart';
import 'package:myzani/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:myzani/features/home/presentation/widgets/custom_f_a_b.dart';
import 'package:myzani/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final pages = [
    HomeViewBody(),
    Container(color: Colors.green), // page 2
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
    Container(color: Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: currentIndex, children: pages),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFAB(
        onTap: () => setState(() => currentIndex = 2),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
