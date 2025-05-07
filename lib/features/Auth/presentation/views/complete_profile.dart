import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_nutrition/core/widgets/custom_progress_hud.dart';
import 'package:food_nutrition/features/Auth/presentation/cubits/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:food_nutrition/features/Auth/presentation/views/widgets/complete_profile_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/utils/app_colors.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompleteProfileCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocConsumer<CompleteProfileCubit, CompleteProfileState>(
          listener: (context, state) {
            if (state is CompleteProfileSuccess) {
            } else if (state is CompleteProfileFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return CustomProgressHud(
              isLoading: state is CompleteProfileLoading ? true : false,
              child: const CompleteProfileViewBody(),
            );
          },
        ),
      ),
    );
  }
}
