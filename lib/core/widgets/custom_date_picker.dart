import 'package:flutter/material.dart';
import 'package:food_nutrition/core/utils/app_styles.dart';
import 'package:food_nutrition/core/widgets/custom_image_container.dart';
import 'package:food_nutrition/res/assets_res.dart';
import 'package:intl/intl.dart';

import '../utils/app_colors.dart';

class CustomDatePicker extends StatefulWidget {
  final ValueChanged<DateTime?>? onDateChanged;
  final String? hintText;

  const CustomDatePicker({super.key, this.onDateChanged, this.hintText});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialDate: _selectedDate ?? DateTime.now());
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate!);
      });
      widget.onDateChanged?.call(_selectedDate);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const CustomImageContainer(image: AssetsRes.DATE),
            Expanded(child: TextField(
              controller: _dateController,
              enabled: false,
              style: AppStyles.regular14,
              decoration: InputDecoration(
                hintText: widget.hintText ?? 'Date of Birth',
                hintStyle: AppStyles.regular14.copyWith(fontSize: 12),
                border: InputBorder.none,
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
