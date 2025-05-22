import 'package:flutter/material.dart';
import 'package:food_nutrition/core/utils/app_styles.dart';

import 'meal_details_view.dart';

class RecentItem extends StatelessWidget {
  final String name, calories, image;

  const RecentItem(
      {super.key,
      required this.name,
      required this.calories,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MealDetailsView(name: name, calories: calories, image: image),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 1,
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: AppStyles.regular14,
            ),
            if (calories.isNotEmpty)
              Text(
                calories,
                style: AppStyles.medium12,
              ),
          ],
        ),
      ),
    );
  }
}
