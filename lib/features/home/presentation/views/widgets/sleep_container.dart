import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../res/assets_res.dart';

class SleepContainer extends StatelessWidget {
  const SleepContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        image: const DecorationImage(image: AssetImage(AssetsRes.SLEEP_GRAPH)),
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 12)
          ]),
      child: const Padding(
        padding: EdgeInsets.only(left: 20, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sleep',
              style: AppStyles.bold14,
            ),
            Text(
              '8h 20m',
              style: AppStyles.semiBold14,
            )
          ],
        ),
      ),
    );
  }
}
