import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_icon.dart';

class MealScheduleView extends StatelessWidget {
  final String name, calories, image;

  const MealScheduleView(
      {super.key,
      required this.name,
      required this.calories,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomIcon(
                      onPressed: () => Navigator.pop(context),
                      size: 16,
                      height: 32,
                      width: 32,
                      icon: Icons.arrow_back_ios_new,
                      backgroundColor: AppColors.lightGrey,
                      iconColor: AppColors.black,
                    ),
                    const Spacer(),
                    const Text('Meal Schedule', style: AppStyles.bold24),
                    const Spacer(),
                  ],
                ),
                TableCalendar(

                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  calendarFormat: CalendarFormat.week,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
