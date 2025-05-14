import 'package:food_nutrition/core/services/gemini_service.dart';
import 'package:get_it/get_it.dart';

import '../../features/Auth/data/repos/auth_repo_impl.dart';
import '../../features/Auth/domain/repos/auth_repo.dart';
import 'firebase_auth_service.dart';

final getIt = GetIt.instance;

void setupGetIt(){
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(firebaseAuth: getIt<FirebaseAuthService>()));
  getIt.registerSingleton<GeminiService>(GeminiService());

}