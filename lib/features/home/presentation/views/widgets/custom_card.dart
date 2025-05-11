import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../res/assets_res.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.4,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: AppColors.primaryG),
          borderRadius: BorderRadius.circular(15)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AssetsRes.BG_DOTS,
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15, vertical: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Chat with AI',
                      style: AppStyles.bold20
                          .copyWith(color: AppColors.white),
                    ),
                    Text(
                      'Explain your problem',
                      style: AppStyles.medium12.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 120,
                      height: 40,
                      child: CustomButton(
                        onPressed: () {},
                        title: 'Start Chat',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        type: CustomButtonType.bgSGradient,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 70,
                ),
                Image.asset(
                  AssetsRes.CHAT_BOT,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
