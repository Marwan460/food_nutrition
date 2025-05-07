import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_nutrition/features/Auth/presentation/views/widgets/password_field.dart';
import 'package:food_nutrition/features/Auth/presentation/views/widgets/social_icon.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/or_divider.dart';
import '../../../../../res/assets_res.dart';
import '../../cubits/login_cubit/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            autovalidateMode: _autoValidateMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hey there',
                  style: AppStyles.regular16,
                ),
                const Text(
                  'Welcome Back',
                  style: AppStyles.bold20,
                ),
                const SizedBox(
                  height: 30,
                ),
                 CustomTextField(
                  onSaved: (value){
                    email = value!;
                  },
                  hintText: 'Email',
                  image: AssetsRes.EMAIL,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                 PasswordField(
                  onSaved: (value){
                    password = value!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Forgot your password?',
                  style: AppStyles.medium12.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<LoginCubit>().loginWithEmailAndPassword(email, password);
                      } else {
                        setState(() {
                          _autoValidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    title: 'Login'),
                const SizedBox(
                  height: 20,
                ),
                const OrDivider(),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(image: AssetsRes.GOOGLE),
                    SizedBox(
                      width: 30,
                    ),
                    SocialIcon(image: AssetsRes.FACEBOOK),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account yet? ',
                      style:
                      AppStyles.regular14.copyWith(color: AppColors.black),
                    ),
                    Text(
                      'Register',
                      style: AppStyles.medium12.copyWith(
                          fontSize: 14, color: const Color(0xffC58BF2)),
                    )
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
