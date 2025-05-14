import 'package:flutter/material.dart';
import 'package:food_nutrition/core/utils/app_styles.dart';

import '../../../../../core/utils/app_colors.dart';

class MessageContainer extends StatelessWidget {
  final String message;
  final bool isUser;

  const MessageContainer(
      {super.key, required this.message, this.isUser = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.7,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isUser ? AppColors.lightGrey : AppColors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SelectableText(
          message,
            style: AppStyles.regular16.copyWith(color: isUser ? AppColors.black : AppColors.white),
        ),
      ),
    );
  }
}
