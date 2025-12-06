import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_styles.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/features/transactions_management/domain/entities/category_entity.dart';

class CategoryDropdown extends StatefulWidget {
  final List<CategoryEntity> categories;
  final ValueChanged<CategoryEntity> onChanged;

  const CategoryDropdown({
    super.key,
    required this.categories,
    required this.onChanged,
  });

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String? selectedCategoryName;

  @override
  void initState() {
    super.initState();
    if (widget.categories.isNotEmpty) {
      selectedCategoryName = widget.categories[0].name;
    }
  }

  @override
  void didUpdateWidget(covariant CategoryDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.categories.any((c) => c.name == selectedCategoryName)) {
      selectedCategoryName = widget.categories.isNotEmpty ? widget.categories[0].name : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5.h, left: 10.w),
          child: Text(
            'Category',
            style: AppStyles.textStyle14Regular(context)
                .copyWith(color: theme.textSecondaryColor),
          ),
        ),
        DropdownButtonFormField<String>(
          value: selectedCategoryName,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: theme.borderLightColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: theme.primaryColor),
            ),
          ),
          items: widget.categories.map((cat) {
            return DropdownMenuItem<String>(
              value: cat.name,
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      cat.imagePath,
                      width: 30.w,
                      height: 30.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(cat.name),
                ],
              ),
            );
          }).toList(),
          onChanged: (val) {
            setState(() {
              selectedCategoryName = val;
              final category = widget.categories.firstWhere((c) => c.name == val!);
              widget.onChanged(category);
            });
          },
        ),
      ],
    );
  }
}
