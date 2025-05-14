import 'package:flutter/material.dart';
import 'package:food_nutrition/features/home/presentation/views/widgets/custom_row.dart';
import 'package:food_nutrition/features/home/presentation/views/widgets/water_intake_linear.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class WaterIntake extends StatefulWidget {
  const WaterIntake({super.key});

  @override
  State<WaterIntake> createState() => _WaterIntakeState();
}

class _WaterIntakeState extends State<WaterIntake> {
  List waterArr = [
    {"title": "6am - 8am", "subtitle": "600ml"},
    {"title": "9am - 11am", "subtitle": "500ml"},
    {"title": "11am - 2pm", "subtitle": "1000ml"},
    {"title": "2pm - 4pm", "subtitle": "700ml"},
    {"title": "4pm - now", "subtitle": "900ml"},
  ];

  @override
  Widget build(BuildContext context) {
    return
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.white,
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 12)]),
          child: Row(
            children: [
              const WaterIntakeLinear(),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Water Intake', style: AppStyles.bold14),
                  const Text(
                    '4 Litres',
                    style: AppStyles.semiBold14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Real time updates',
                    style: AppStyles.regular14.copyWith(color: AppColors.grey, fontSize: 10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: waterArr.map((e) {
                      var isLast = e == waterArr.last;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 13),
                        child: CustomRow(
                          title: e['title'],
                          subtitle: e['subtitle'],
                          opacity: isLast ? 1 : 0.5,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        );
  }
}

