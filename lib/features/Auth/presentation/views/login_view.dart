import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_nutrition/core/widgets/custom_progress_hud.dart';
import 'package:food_nutrition/features/Auth/presentation/views/widgets/login_view_body.dart';
import 'package:food_nutrition/features/home/presentation/views/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/repos/auth_repo.dart';
import '../cubits/login_cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Builder(builder: (context) {
          return BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeView()));
              }
              if (state is LoginFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return CustomProgressHud(
                isLoading: state is LoginLoading ? true : false,
                child: const LoginViewBody(),
              );
            },
          );
        }),
      ),
    );
  }
}
