import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class CustomWeightAndHeightContainer extends StatelessWidget {
  final String image, hintText, value;
  final void Function(String?)? onSaved;

  const CustomWeightAndHeightContainer(
      {super.key, required this.image, required this.hintText, this.onSaved, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            onSaved: onSaved,
            hintText: value,
            image: image,
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          alignment: Alignment.center,
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: AppColors.secondaryG),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            hintText,
            style: AppStyles.medium12.copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}
