import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

enum CustomButtonType { bgGradient, bgSGradient, textGradient }

class CustomButton extends StatelessWidget {
  final CustomButtonType type;
  final String title;
  final double fontSize, elevation;
  final FontWeight fontWeight;
  final void Function() onPressed;

  const CustomButton(
      {super.key,
      this.type = CustomButtonType.bgGradient,
      required this.onPressed,
      required this.title,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w700,
      this.elevation = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: type == CustomButtonType.bgSGradient
                  ? AppColors.secondaryG
                  : AppColors.primaryG),
          borderRadius: BorderRadius.circular(25),
          boxShadow: type == CustomButtonType.bgGradient ||
                  type == CustomButtonType.bgSGradient
              ? [
                  const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 0.5,
                      offset: Offset(0, 0.5))
                ]
              : null),
      child: MaterialButton(
        onPressed: onPressed,
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        textColor: AppColors.primary1,
        minWidth: double.maxFinite,
        elevation: type == CustomButtonType.bgGradient ||
                type == CustomButtonType.bgSGradient
            ? 0
            : elevation,
        color: type == CustomButtonType.bgGradient ||
                type == CustomButtonType.bgSGradient
            ? Colors.transparent
            : AppColors.white,
        child: type == CustomButtonType.bgGradient ||
                type == CustomButtonType.bgSGradient
            ? Text(
                title,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              )
            : ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) {
                  return const LinearGradient(
                          colors: AppColors.primaryG,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)
                      .createShader(
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                },
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppColors.primary1,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
              ),
      ),
    );
  }
}
