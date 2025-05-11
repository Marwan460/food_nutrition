import 'package:dartz/dartz.dart';
import 'package:food_nutrition/core/errors/failure.dart';
import 'package:food_nutrition/features/Auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      String email, String password);

}