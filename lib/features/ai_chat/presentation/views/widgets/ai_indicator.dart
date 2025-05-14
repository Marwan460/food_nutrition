import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class AiIndicator extends StatelessWidget {
  const AiIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2
              )
            ]
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: AppColors.primary1,
                strokeWidth: 2,
              ),),
            SizedBox(width: 10),
            Text('AI is typing...', style: AppStyles.regular14,),
          ],
        ),
      ),
    );
  }
}
