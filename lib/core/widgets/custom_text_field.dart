import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String hintText, image;
  final TextInputType? keyboardType;
  final bool obscureText;
  final EdgeInsets? margin;
  final void Function(String?)? onSaved;

  const CustomTextField(
      {super.key,
      this.suffixIcon,
      required this.hintText,
      required this.image,
      this.controller,
      this.keyboardType,
      this.margin,
      this.obscureText = false, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: AppColors.lightGrey, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        onSaved: onSaved,
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Field is required';
          }
          return null;
        },
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          fillColor: AppColors.lightGrey,
            focusColor: AppColors.lightGrey,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: Container(
                alignment: Alignment.center,
                width: 20,
                height: 20,
                child: Image.asset(
                  image,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                  color: AppColors.grey,
                )),
            hintStyle: const TextStyle(color: AppColors.grey, fontSize: 12)),
      ),
    );
  }
}
