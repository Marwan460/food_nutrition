import 'package:flutter/material.dart';
import 'package:food_nutrition/core/widgets/custom_image_container.dart';

import '../../res/assets_res.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomDropdownButton extends StatefulWidget {
  final ValueChanged<String?>? onChanged;

  const CustomDropdownButton({super.key, required this.onChanged});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightGrey, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          const CustomImageContainer(image: AssetsRes.GENDER),
          Expanded(
            child: DropdownButton(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.grey,
                size: 25,
              ),
              focusColor: AppColors.lightGrey,
              dropdownColor: AppColors.lightGrey,
              hint: _selectedValue == null
                  ? const Text(
                      'Choose Gender',
                      style: AppStyles.medium12,
                    )
                  : Text(
                      _selectedValue!,
                      style: AppStyles.regular14,
                    ),
              isExpanded: true,
              items: ['Male', 'Female']
                  .map(
                    (name) => DropdownMenuItem(
                      value: name,
                      child: Text(
                        name,
                        style: AppStyles.regular14,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
                widget.onChanged?.call(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
