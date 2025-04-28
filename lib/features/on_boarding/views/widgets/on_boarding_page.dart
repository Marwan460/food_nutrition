import 'package:flutter/material.dart';
import 'package:health_tracker/core/utils/app_styles.dart';

class OnBoardingPage extends StatelessWidget {
  final String image, title, description;
  const OnBoardingPage({super.key, required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
      return SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image,width: width,fit: BoxFit.fitWidth,),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(title, style: AppStyles.bold24,),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(description, style: AppStyles.regular14,),
            ),
          ],
        ),
      );
  }
}
