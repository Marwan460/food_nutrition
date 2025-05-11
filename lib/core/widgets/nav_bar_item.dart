import 'package:flutter/material.dart';
import 'package:food_nutrition/core/utils/app_colors.dart';

class NavBarItem extends StatelessWidget {
  final void Function() onTap;
  final String icon, selectIcon;
  final bool isActive;

  const NavBarItem(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.selectIcon,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isActive ? selectIcon : icon,
            width: 25,
            height: 25,
            fit: BoxFit.fitWidth,
          ),
           SizedBox(
            height: isActive ? 8 : 12,
          ),
          if(isActive)
          Container(
            height: 4,
            width: 4,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: AppColors.secondaryG,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          )
        ],
      ),
    );
  }
}
