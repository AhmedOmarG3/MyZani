import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';

class CategoryItem {
  final String name;
  final String imagePath;

  CategoryItem({required this.name, required this.imagePath});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryItem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          imagePath == other.imagePath;

  @override
  int get hashCode => name.hashCode ^ imagePath.hashCode;
}

class CategoryDropdown extends StatefulWidget {
  final List<CategoryItem> categories;
  final ValueChanged<CategoryItem> onChanged;

  const CategoryDropdown({
    super.key,
    required this.categories,
    required this.onChanged,
  });

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  CategoryItem? selectedCategory;

  @override
  void initState() {
    super.initState();
    if (widget.categories.isNotEmpty) {
      selectedCategory = widget.categories[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5.h, left: 10.w),
          child: Text(
            'Category',
            style: AppStyles.textStyle14Regular.copyWith(
              color: const Color(0xff666666),
            ),
          ),
        ),
        DropdownButtonFormField<CategoryItem>(
          value: selectedCategory,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 10.w,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(color: Color(0xffDDDDDD)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(color: Colors.blue),
            ),
          ),
          items: widget.categories.map((category) {
            return DropdownMenuItem<CategoryItem>(
              value: category,
              child: Row(
                children: [
                  ClipOval(
  child: Image.asset(
    category.imagePath,
    width: 30.w,
    height: 30.w,
    fit: BoxFit.cover,
  ),
),
                 
                  SizedBox(width: 10.w),
                  Text(category.name),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedCategory = value;
            });
            if (value != null) widget.onChanged(value);
          },
        ),
      ],
    );
  }
}
