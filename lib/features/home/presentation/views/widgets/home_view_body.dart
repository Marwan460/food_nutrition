import 'package:flutter/material.dart';
import 'package:food_nutrition/core/utils/app_colors.dart';
import 'package:food_nutrition/core/utils/app_styles.dart';
import 'package:food_nutrition/features/home/presentation/views/widgets/calories_container.dart';
import 'package:food_nutrition/features/home/presentation/views/widgets/custom_card.dart';
import 'package:food_nutrition/features/home/presentation/views/widgets/sleep_container.dart';
import 'package:food_nutrition/features/home/presentation/views/widgets/water_intake.dart';
import 'package:food_nutrition/features/home/presentation/views/widgets/weight_container.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome Back',
                style: AppStyles.medium12,
              ),
              const Text(
                'Good Morning',
                style: AppStyles.bold20,
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomCard(),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Balanced Plane',
                style: AppStyles.semiBold14
                    .copyWith(fontSize: 16, color: AppColors.black),
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WaterIntake(),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      SleepContainer(),
                      SizedBox(
                        height: 15,
                      ),
                      CaloriesContainer(),
                      SizedBox(
                        height: 15,
                      ),
                      WeightContainer(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
