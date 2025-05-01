import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isCheck = !isCheck;
        });
      },
      icon: Icon(
        isCheck
            ? Icons.check_box_outlined
            : Icons.check_box_outline_blank_outlined,
        size: 20,
        color: AppColors.grey,
      ),
    );
  }
}
