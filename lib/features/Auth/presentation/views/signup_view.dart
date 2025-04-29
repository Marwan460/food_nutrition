import 'package:flutter/material.dart';
import 'package:health_tracker/core/utils/app_colors.dart';
import 'package:health_tracker/core/utils/app_styles.dart';
import 'package:health_tracker/core/widgets/custom_button.dart';
import 'package:health_tracker/core/widgets/custom_text_field.dart';
import 'package:health_tracker/core/widgets/or_divider.dart';
import 'package:health_tracker/features/Auth/presentation/views/widgets/password_field.dart';
import 'package:health_tracker/features/Auth/presentation/views/widgets/social_icon.dart';
import 'package:health_tracker/features/on_boarding/views/widgets/custom_check_box.dart';

import '../../../../res/assets_res.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Hey there,',
                  style: AppStyles.regular16,
                ),
                const Text(
                  'Create an Account',
                  style: AppStyles.bold20,
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomTextField(
                  hintText: 'First Name',
                  image: AssetsRes.USER_TEXT,
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomTextField(
                  hintText: 'Last Name',
                  image: AssetsRes.USER_TEXT,
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomTextField(
                  hintText: 'Email',
                  image: AssetsRes.EMAIL,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                const PasswordField(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const CustomCheckBox(),
                    Expanded(
                        child: Text(
                      'By continuing you accept our Privacy Policy and Term of Use',
                      style: AppStyles.regular14.copyWith(fontSize: 10),
                    ),),
                  ],
                ),
                const SizedBox(height: 120,),
                CustomButton(onPressed: (){}, title: 'Register'),
                const SizedBox(height: 20,),
                const OrDivider(),
                const SizedBox(height: 20,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(image: AssetsRes.GOOGLE),
                    SizedBox(width: 30,),
                    SocialIcon(image: AssetsRes.FACEBOOK)
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?' ,style: AppStyles.regular14.copyWith(color: AppColors.black),),
                    const Text('Login',style: AppStyles.regular14,)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
