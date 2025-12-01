import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/utils/helpers/my_clipper.dart';

class CustomHomeAppBarContainer extends StatelessWidget {
  const CustomHomeAppBarContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
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
      ),
    );
  }
}
