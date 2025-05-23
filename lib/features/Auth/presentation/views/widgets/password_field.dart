import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../res/assets_res.dart';

class PasswordField extends StatefulWidget {
  final void Function(String?)? onSaved;
  const PasswordField({super.key, this.onSaved});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onSaved: widget.onSaved,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      hintText: 'Password',
      image: AssetsRes.LOCK,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {obscureText = !obscureText;});
        },
        child: obscureText
            ? const Icon(
                Icons.remove_red_eye,
                color: AppColors.grey,
              )
            : const Icon(
                Icons.visibility_off,
                color: AppColors.grey,
              ),
      ),
    );
  }
}
