import 'package:flutter/material.dart';
import 'package:food_nutrition/core/widgets/custom_button.dart';
import 'package:food_nutrition/core/widgets/custom_date_picker.dart';
import 'package:food_nutrition/core/widgets/custom_text_field.dart';
import 'package:food_nutrition/features/Auth/presentation/views/login_view.dart';
import 'package:food_nutrition/features/Auth/presentation/views/widgets/custom_weight_and_height_container.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_dropdown_button.dart';
import '../../../../res/assets_res.dart';


class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  String? _selectedGender;
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Column(
              children: [
                Image.asset(AssetsRes.COMPLETE_PROFILE),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Let’s complete your profile',
                  style: AppStyles.bold20,
                ),
                Text(
                  'It will help us to know more about you!',
                  style: AppStyles.regular14.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomDropdownButton(onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },),
                const SizedBox(height: 15,),
                CustomDatePicker(
                  hintText: 'Date of Birth',
                  onDateChanged: (date){
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                ),
                const SizedBox(height: 15,),
                const CustomWeightAndHeightContainer(image: AssetsRes.WEIGHT, hintText: 'KG'),
                const SizedBox(height: 15,),
                const CustomWeightAndHeightContainer(image: AssetsRes.HIGHT, hintText: 'CM'),
                const SizedBox(height: 30,),
                CustomButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                }, title: 'Confirm')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
