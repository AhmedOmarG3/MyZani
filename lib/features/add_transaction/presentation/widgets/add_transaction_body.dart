import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/widgets/custom_text_button.dart';
import 'package:myzani/features/add_transaction/presentation/views/add_transaction_view.dart';
import 'package:myzani/features/add_transaction/presentation/widgets/category_drop_dwon.dart';
import 'package:myzani/features/add_transaction/presentation/widgets/custom_add_transaction_text_feild.dart';
import 'package:myzani/features/add_transaction/presentation/widgets/custom_date_textfield.dart';
import 'package:myzani/features/add_transaction/presentation/widgets/transaction_type_selector.dart';

class AddTransactionBody extends StatelessWidget {
  const AddTransactionBody({
    super.key,
    required this.mainColor,
    required this.selectedType,
    required this.onTypeChanged,
  });

  final Color mainColor;
  final TransactionType selectedType;
  final ValueChanged<TransactionType> onTypeChanged;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Material(
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor,
              blurRadius: 25,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TransactionTypeSelector(
              selectedType: selectedType,
              onChanged: onTypeChanged,
            ),
            SizedBox(height: 20.h),
            CategoryDropdown(
              categories: [
                CategoryItem(name: 'Food', imagePath: AppImages.imagesYoutube),
                CategoryItem(
                  name: 'Transport',
                  imagePath: AppImages.imagesYoutube,
                ),
                CategoryItem(
                  name: 'Shopping',
                  imagePath: AppImages.imagesYoutube,
                ),
              ],
              onChanged: (category) {
                // Handle category selection
              },
            ),
            SizedBox(height: 10.h),
            CustomAddTransactionTextFeild(
              title: 'Amount',
              keyboardType: TextInputType.number,
              maxlines: 1,
            ),
            SizedBox(height: 10.h),
            CustomDateTextField(title: 'Date', focusColor: mainColor),
            SizedBox(height: 10.h),
            CustomAddTransactionTextFeild(
              title: 'Description',
              maxlines: 3,
              contentpaddong: EdgeInsets.only(top: 20.h, bottom: 20.h),
            ),
            SizedBox(height: 20.h),
            CustomTextButton(
              fixedSize: Size(1.sw, 61.h),
              text: selectedType == TransactionType.expense
                  ? "Add Expense"
                  : "Add Income",
              borderRedius: 20.r,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
