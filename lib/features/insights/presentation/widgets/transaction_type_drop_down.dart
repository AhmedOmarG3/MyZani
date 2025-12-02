
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/colors.dart';

class CustomTransactionTypeDropDown extends StatefulWidget {
  const CustomTransactionTypeDropDown({super.key});

  @override
  State<CustomTransactionTypeDropDown> createState() =>
      _CustomTransactionTypeDropDownState();
}

class _CustomTransactionTypeDropDownState
    extends State<CustomTransactionTypeDropDown> {
  String selectedType = 'Expenses';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: 40.h,
        width: 120.w,
        decoration: BoxDecoration(
          border: Border.all(color: kGreyColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(5.r),
            value: selectedType,
            items: ['Expenses', 'Income'].map((type) {
              return DropdownMenuItem(
                value: type,
                child: Text(
                  type,
                  style: AppStyles.textStyle14Regular.copyWith(
                    color: Color(0xff666666),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedType = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
