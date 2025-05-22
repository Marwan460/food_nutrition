import 'package:flutter/material.dart';
import 'package:food_nutrition/core/utils/app_colors.dart';
import 'package:food_nutrition/features/meals/presentation/view/widgets/header_section.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../res/assets_res.dart';
import '../../../../home/presentation/views/widgets/nutrition_facts.dart';
import 'meal_schedule_view.dart';

class MealDetailsView extends StatelessWidget {
  final String name, calories, image;

  const MealDetailsView(
      {super.key,
      required this.name,
      required this.calories,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const HeaderSection(),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showMenu(
                            shadowColor: Colors.transparent,
                            color: AppColors.lightGrey,
                            context: context,
                            position: const RelativeRect.fromLTRB(double.infinity, 0, 0, 0),
                            items: [
                              CheckedPopupMenuItem(
                                child: const Text(
                                  'Meal Schedule',
                                  style: AppStyles.regular16,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>  MealScheduleView(
                                        name: name,
                                        calories: calories,
                                        image: image,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ]);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Image.asset(AssetsRes.DOT),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text('Nutrition Breakdown', style: AppStyles.bold20),
                const SizedBox(height: 14),
                Center(
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.lightGrey,
                    ),
                    child: Image.asset(image),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  '$name\n$calories',
                  style: AppStyles.bold20
                ),
                const SizedBox(height: 14),
                Text('Nutrition Facts', style: AppStyles.bold20.copyWith(fontSize: 18)),
                const SizedBox(height: 20),
                const NutritionFacts(label: 'Carbohydrates', value: 24),
                const SizedBox(height: 12),
                const NutritionFacts(label: 'Carbohydrates', value: 8),
                const SizedBox(height: 12),
                const NutritionFacts(label: 'Carbohydrates', value: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
