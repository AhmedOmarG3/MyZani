import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_images.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh * .35,
      width: 1.sw,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff2A7C76), Color(0xff429690)],
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
