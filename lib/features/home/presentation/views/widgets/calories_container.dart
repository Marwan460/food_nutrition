import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CaloriesContainer extends StatelessWidget {
  const CaloriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 12)
          ]),
      child: const Padding(
        padding: EdgeInsets.only(left: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Calories',
              style: AppStyles.bold14,
            ),
            Text(
              '2000 KCal',
              style: AppStyles.semiBold14,
            )
          ],
        ),
      ),
    );
  }
}
