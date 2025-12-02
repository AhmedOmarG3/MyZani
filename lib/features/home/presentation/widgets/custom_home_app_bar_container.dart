import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/utils/helpers/my_clipper.dart';
import 'package:myzani/core/widgets/app_bar_container.dart';

class CustomHomeAppBarContainer extends StatelessWidget {
  const CustomHomeAppBarContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: AppBarContainer(child: child),
    );
  }
}
