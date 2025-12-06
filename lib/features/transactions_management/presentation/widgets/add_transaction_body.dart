import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:myzani/core/app_images.dart';
import 'package:myzani/core/theme/app_theme.dart';
import 'package:myzani/core/validators.dart';
import 'package:myzani/core/widgets/custom_text_button.dart';
import 'package:myzani/features/home/presentation/blocs/home/home_cubit.dart';
import 'package:myzani/features/transactions_management/domain/entities/category_entity.dart';
import 'package:myzani/features/transactions_management/domain/entities/transaction_entity.dart';
import 'package:myzani/features/transactions_management/presentation/blocs/add_transaction/add_transaction_cubit.dart';
import 'package:myzani/features/transactions_management/presentation/views/add_transaction_view.dart';
import 'package:myzani/features/transactions_management/presentation/widgets/category_drop_dwon.dart';
import 'package:myzani/features/transactions_management/presentation/widgets/custom_add_transaction_text_feild.dart';
import 'package:myzani/features/transactions_management/presentation/widgets/custom_date_textfield.dart';
import 'package:myzani/features/transactions_management/presentation/widgets/transaction_type_selector.dart';

class AddTransactionBody extends StatefulWidget {
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
  State<AddTransactionBody> createState() => _AddTransactionBodyState();
}

class _AddTransactionBodyState extends State<AddTransactionBody> {
  late final TextEditingController titleController;
  late final TextEditingController amountController;
  late final TextEditingController dateController;
  late final TextEditingController descriptionController;
  CategoryEntity? categoryItem;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<CategoryEntity> getCategories() {
    final baseCategories = widget.selectedType == TransactionType.expense
        ? [
            CategoryEntity(name: 'Food', imagePath: AppImages.imagesFood),
            CategoryEntity(
              name: 'Transport',
              imagePath: AppImages.imagesTransport,
            ),
            CategoryEntity(
              name: 'Shopping',
              imagePath: AppImages.imagesShopping,
            ),
            CategoryEntity(
              name: 'Entertainment',
              imagePath: AppImages.imagesEntertainment,
            ),
          ]
        : [
            CategoryEntity(
              name: 'Salary',
              imagePath: AppImages.imagesVecteesalary,
            ),
            CategoryEntity(
              name: 'Freelance',
              imagePath: AppImages.imagesFreelance,
            ),
            CategoryEntity(
              name: 'Investment',
              imagePath: AppImages.imagesInvestment,
            ),
          ];

    return [
      ...baseCategories,
      CategoryEntity(name: 'Other', imagePath: AppImages.imagesOther),
    ];
  }

  @override
  initState() {
    super.initState();
    titleController = TextEditingController();
    amountController = TextEditingController();
    dateController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return BlocListener<AddTransactionCubit, AddTransactionState>(
      listener: (context, state) {
        if (state is AddTransactionSuccess) {
          Navigator.pop(context);
        }
      },
      child: Material(
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
                selectedType: widget.selectedType,
                onChanged: widget.onTypeChanged,
              ),
              SizedBox(height: 20.h),
              CategoryDropdown(
                categories: getCategories(),
                onChanged: (category) {
                  setState(() {
                    categoryItem = category;
                  });
                },
              ),
              SizedBox(height: 10.h),
              AddTransactionForm(
                titleController: titleController,
                amountController: amountController,
                dateController: dateController,
                descriptionController: descriptionController,
                formKey: formKey,
              ),
              SizedBox(height: 20.h),
              CustomTextButton(
                fixedSize: Size(1.sw, 61.h),
                text: widget.selectedType == TransactionType.expense
                    ? "Add Expense"
                    : "Add Income",
                borderRedius: 20.r,
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  if (categoryItem == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select a category")),
                    );
                    return;
                  }

                  final amount = double.parse(amountController.text);

                  final date = DateFormat(
                    'yyyy-MM-dd HH:mm',
                  ).parseStrict(dateController.text);

                  final transaction = TransactionEntity(
                    title: titleController.text,
                    description: descriptionController.text,
                    category: categoryItem!,
                    amount: amount,
                    date: date,
                    type: widget.selectedType,
                  );

                  context.read<AddTransactionCubit>().addTransaction(
                    transactionEntity: transaction,
                  );
                  context.read<HomeCubit>().loadHomeData();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddTransactionForm extends StatelessWidget {
  const AddTransactionForm({
    super.key,
    required this.titleController,
    required this.amountController,
    required this.dateController,
    required this.descriptionController,
    required this.formKey,
  });

  final TextEditingController titleController;
  final TextEditingController amountController;
  final TextEditingController dateController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomAddTransactionTextFeild(
            validator: Validators.validateName,
            controller: titleController,
            title: 'Title',
            keyboardType: TextInputType.text,
            maxlines: 1,
          ),
          SizedBox(height: 10.h),
          CustomAddTransactionTextFeild(
            validator: Validators.validateAmount,
            controller: amountController,
            title: 'Amount',
            keyboardType: TextInputType.number,
            maxlines: 1,
          ),
          SizedBox(height: 10.h),
          CustomDateTextField(
            title: 'Date',
            controller: dateController,
            validator: Validators.validateDate,
          ),
          SizedBox(height: 10.h),
          CustomAddTransactionTextFeild(
            validator: Validators.validateDescription,
            title: 'Description',
            controller: descriptionController,
            maxlines: 3,
            contentpaddong: EdgeInsets.only(top: 20.h, bottom: 20.h),
          ),
        ],
      ),
    );
  }
}
