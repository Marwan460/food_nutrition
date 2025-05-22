import 'package:flutter/material.dart';
import 'package:food_nutrition/core/utils/app_colors.dart';
import 'package:food_nutrition/features/meals/presentation/view/widgets/header_section.dart';
import 'package:food_nutrition/features/meals/presentation/view/widgets/popular_item.dart';
import 'package:food_nutrition/features/meals/presentation/view/widgets/recent_item.dart';
import 'package:food_nutrition/res/assets_res.dart';

import '../../../../core/utils/app_styles.dart';

class MealView extends StatelessWidget {
  const MealView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 24),

              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search foods',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Recent Section
              _buildSectionHeader('Recent'),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    RecentItem(name: 'Grilled Chicken', calories: '320', image: AssetsRes.MEAL_ICON),
                    RecentItem(name: 'Grilled Chicken', calories: '320', image: AssetsRes.MEAL_ICON),
                    RecentItem(name: 'Grilled Chicken', calories: '320', image: AssetsRes.MEAL_ICON),
                    RecentItem(name: 'Grilled Chicken', calories: '320', image: AssetsRes.MEAL_ICON),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Popular Section
              _buildSectionHeader('Popular'),
              const SizedBox(height: 12),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                 PopularItem(name: 'Grilled Chicken', calories: '320', image: AssetsRes.MEAL_ICON),
                 PopularItem(name: 'Grilled Chicken', calories: '320', image: AssetsRes.MEAL_ICON),
                 PopularItem(name: 'Grilled Chicken', calories: '320', image: AssetsRes.MEAL_ICON),
                 PopularItem(name: 'Grilled Chicken', calories: '320', image: AssetsRes.MEAL_ICON),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}


Widget _buildSectionHeader(String title) {
  return Text(
    title,
    style: AppStyles.bold20
  );
}



