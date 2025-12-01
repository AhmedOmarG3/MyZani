import 'package:flutter/material.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/colors.dart';
import 'package:myzani/features/home/presentation/views/home_view.dart';
import 'package:myzani/features/home/presentation/widgets/nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: kSecondryColor,
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      shadowColor: Colors.black.withOpacity(0.06),
      child: Container(
        height: 65,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side
            Row(
              children: [
                NavItem(
                  icon: AppImages.imagesHomesvg,
                  index: 0,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
                SizedBox(width: 40),
                NavItem(
                  icon: AppImages.imagesInsights,
                  index: 1,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
              ],
            ),

            // Right side
            Row(
              children: [
                NavItem(
                  icon: AppImages.imagesTransaction,
                  index: 3,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
                SizedBox(width: 40),
                NavItem(
                  icon: AppImages.imagesProfile,
                  index: 4,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
