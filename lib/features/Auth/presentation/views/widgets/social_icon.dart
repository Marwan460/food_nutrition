import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class SocialIcon extends StatelessWidget {
  final String image;
  const SocialIcon({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.grey.withOpacity(0.4),),
        ),
        child: Image.asset(image,width: 20,height: 20,),
      ),
    );
  }
}
