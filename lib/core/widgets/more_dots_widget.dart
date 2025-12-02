import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreDotsWidget extends StatelessWidget {
  const MoreDotsWidget({super.key, this.size});
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Transform.rotate(
        angle: math.pi / 2,
        child: Icon(Icons.more_vert, size:size?? 25.sp, color: Colors.white),
      ),
    );
  }
}
