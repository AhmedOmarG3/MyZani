import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myzani/core/colors.dart';

class NavItem extends StatelessWidget {
  final String icon;
  final int index;
  final int currentIndex;
  final Function(int) onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: SvgPicture.asset(
        icon,
        color: isSelected ? kPrimaryColor : Color(0xffAAAAAA),
      ),
    );
  }
}
