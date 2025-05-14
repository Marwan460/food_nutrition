import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_nutrition/core/services/gemini_service.dart';
import 'package:food_nutrition/core/services/get_it_service.dart';
import 'package:food_nutrition/core/utils/app_colors.dart';
import 'package:food_nutrition/features/ai_chat/presentation/cubit/chat_cubit/chat_cubit.dart';
import 'package:food_nutrition/features/ai_chat/presentation/views/widgets/ai_chat_view_body.dart';

class AiChatView extends StatelessWidget {
  const AiChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(getIt<GeminiService>()),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.white,
        body: AiChatViewBody(),
      ),
    );
  }
}
