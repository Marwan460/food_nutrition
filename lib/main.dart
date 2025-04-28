import 'package:flutter/material.dart';
import 'package:health_tracker/core/utils/app_colors.dart';
import 'package:health_tracker/features/on_boarding/views/on_boarding_view.dart';
import 'package:health_tracker/res/font_res.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primary1,
        fontFamily: FontRes.POPPINS
      ),
      home: const OnBoardingView(),
    );
  }
}


