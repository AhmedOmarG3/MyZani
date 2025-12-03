import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/theme/app_theme.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Container(
      height: 1.sh * .35,
      width: 1.sw,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: theme.appBarGradientColors,
        ),
    
        image: DecorationImage(
          image: AssetImage(AppImages.imagesAppBarShape),
          alignment: Alignment.centerLeft,
        ),
      ),
      child: child,
    );
  }
}
