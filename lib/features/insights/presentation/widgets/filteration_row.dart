import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myzani/features/insights/presentation/widgets/custom_filter_item.dart';

class FiltertionRow extends StatefulWidget {
  const FiltertionRow({super.key});

  @override
  State<FiltertionRow> createState() => _FiltertionRowState();
}

class _FiltertionRowState extends State<FiltertionRow> {
  List<String> list = ['Day', ' Week', ' Month', ' Year'];
  int index = 0;
  Widget generator(int index) => CustomFilterItem(
    isSelected: index == this.index,
    title: list[index],
    onTap: () => setState(() => this.index = index),
  );
  @override
  Widget build(BuildContext context) {
    return Row(spacing: 5.w, children: List.generate(list.length, generator));
  }
}
