import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_nutrition/features/Auth/domain/entities/user_entity.dart';
import '../../../domain/repos/auth_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    emit(LoginLoading());
    final result = await authRepo.loginWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }
}
