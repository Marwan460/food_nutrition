import 'package:flutter/material.dart';

import '../../res/font_res.dart';
import 'app_colors.dart';

class AppStyles {
  static const TextStyle bold24 = TextStyle(
    fontFamily: FontRes.POPPINS,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Colors.black
  );

  static const TextStyle bold20 = TextStyle(
      fontFamily: FontRes.POPPINS,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.black
  );

  static const TextStyle regular14 = TextStyle(
      fontFamily: FontRes.POPPINS,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.grey
  );

  static const TextStyle regular16 = TextStyle(
      fontFamily: FontRes.POPPINS,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: AppColors.black
  );
}