import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FOOD',
              style: AppStyles.bold24,
            ),
            Text(
              'NUTRITION',
              style: AppStyles.regular16.copyWith(fontSize: 20),
            ),
          ],
        ),

      ],
    );
  }
}
