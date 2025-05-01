import 'package:flutter/material.dart';
import 'package:food_nutrition/core/utils/app_colors.dart';

class CustomImageContainer extends StatelessWidget {
  final String image;

  const CustomImageContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      child: Image.asset(
        image,
        width: 20,
        height: 20,
        fit: BoxFit.contain,
        color: AppColors.grey,
      ),
    );
  }
}
