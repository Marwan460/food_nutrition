import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_nutrition/core/widgets/custom_button.dart';
import 'package:food_nutrition/core/widgets/custom_date_picker.dart';
import 'package:food_nutrition/features/Auth/presentation/views/widgets/custom_weight_and_height_container.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_dropdown_button.dart';
import '../../../../../res/assets_res.dart';
import '../../cubits/complete_profile_cubit/complete_profile_cubit.dart';

class CompleteProfileViewBody extends StatefulWidget {
  const CompleteProfileViewBody({super.key});

  @override
  State<CompleteProfileViewBody> createState() =>
      _CompleteProfileViewBodyState();
}

class _CompleteProfileViewBodyState extends State<CompleteProfileViewBody> {
  late double weight, height;
  late String gender;
  late DateTime date;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  String? _selectedGender;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Form(
            key: _formKey,
            autovalidateMode: _autoValidateMode,
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
                CustomDropdownButton(
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomDatePicker(
                  hintText: 'Date of Birth',
                  onDateChanged: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomWeightAndHeightContainer(
                    onSaved: (value) {
                      weight = double.parse(value!);
                    },
                    image: AssetsRes.WEIGHT,
                    hintText: 'Kg', value: 'Weight',),
                const SizedBox(
                  height: 15,
                ),
                CustomWeightAndHeightContainer(
                    onSaved: (value) {
                      height = double.parse(value!);
                    },
                    image: AssetsRes.HIGHT,
                    hintText: 'CM', value: 'height',),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<CompleteProfileCubit>().completeProfile(
                            gender: _selectedGender!,
                            date: _selectedDate!,
                            weight: weight,
                            height: height);
                      } else {
                        setState(() {
                          _autoValidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    title: 'Confirm')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
