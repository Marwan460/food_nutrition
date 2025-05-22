import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_nutrition/core/services/get_it_service.dart';
import 'package:food_nutrition/features/Auth/presentation/views/login_view.dart';
import 'package:food_nutrition/res/font_res.dart';

import 'core/services/custom_bloc_observer.dart';
import 'core/utils/app_colors.dart';
import 'features/on_boarding/views/on_boarding_view.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Nutrition',
      theme: ThemeData(
        primaryColor: AppColors.primary1,
        fontFamily: FontRes.POPPINS
      ),
      home: const LoginView(),
    );
  }
}


