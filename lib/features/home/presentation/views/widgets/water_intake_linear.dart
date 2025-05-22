import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

import '../../../../../core/utils/app_colors.dart';

class WaterIntakeLinear extends StatelessWidget {
  final Axis direction;
  final double width, height;
  const WaterIntakeLinear({
    super.key,
    this.direction = Axis.vertical,
    this.width = 20,
    this.height = 275,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleAnimationProgressBar(
      height: height,
      width: width,
      backgroundColor: AppColors.lightGrey,
      foregroundColor: Colors.purple,
      ratio: 0.5,
      direction: direction,
      curve: Curves.fastLinearToSlowEaseIn,
      duration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(10),
      gradientColor: const LinearGradient(
        colors: AppColors.primaryG,
      ),
    );
  }
}
