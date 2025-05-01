import 'package:dartz/dartz.dart';
import 'package:food_nutrition/core/errors/failure.dart';
import 'package:food_nutrition/features/Auth/data/models/user_model.dart';
import 'package:food_nutrition/features/Auth/domain/entities/user_entity.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuth;

  AuthRepoImpl({required this.firebaseAuth});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name, ) async{
    try {
      var user = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
