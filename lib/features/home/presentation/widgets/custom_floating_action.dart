import 'package:flutter/material.dart';
import 'package:myzani/core/theme/app_theme.dart';

class CustomFAB extends StatelessWidget {
  final VoidCallback onTap;

  const CustomFAB({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: onTap,
        elevation: 0,
        backgroundColor: Colors.transparent,
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 30, color: theme.onPrimaryColor),
      ),
    );
  }
}
