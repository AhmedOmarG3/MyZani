import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myzani/core/app_router.dart';
import 'package:myzani/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:myzani/features/home/presentation/widgets/custom_floating_action.dart';
import 'package:myzani/features/home/presentation/widgets/home_view_body.dart';
import 'package:myzani/features/insights/presentation/views/add_transaction_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final pages = [
    HomeViewBody(),
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
      floatingActionButton: currentIndex == 0
          ? CustomFAB(onTap: () => context.push(AppRouter.addTrasaction))
          : SizedBox(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
