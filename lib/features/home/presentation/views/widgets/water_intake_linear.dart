import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

import '../../../../../core/utils/app_colors.dart';

class WaterIntakeLinear extends StatelessWidget {
  const WaterIntakeLinear({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleAnimationProgressBar(
      height: 275,
      width: 20,
      backgroundColor: AppColors.lightGrey,
      foregroundColor: Colors.purple,
      ratio: 0.5,
      direction: Axis.vertical,
      curve: Curves.fastLinearToSlowEaseIn,
      duration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(10),
      gradientColor: const LinearGradient(
        colors: AppColors.primaryG,
      ),
    );
  }
}
