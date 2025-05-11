import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomRow extends StatelessWidget {
  final String title, subtitle;
  final double? opacity;
  const CustomRow({super.key, required this.title, required this.subtitle, this.opacity,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.secondary1.withOpacity(opacity ?? 0.5)
          ),
        ),
        const SizedBox(width: 8,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyles.medium12.copyWith(fontSize: 8),),
            Text(subtitle, style: AppStyles.medium12.copyWith(fontSize: 8, color: AppColors.primary1),),
          ],
        )
      ],
    );
  }
}
