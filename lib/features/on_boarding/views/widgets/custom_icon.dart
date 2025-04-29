import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomIcon extends StatelessWidget {
  final void Function() onPressed;
  const CustomIcon({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.primary1,
        borderRadius: BorderRadius.circular(35),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.navigate_next,
          color: AppColors.white,
        ),
      ),
    );
  }
}
