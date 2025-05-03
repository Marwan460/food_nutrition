import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'There was a problem with the network.');
      } else {
        throw CustomException(
            message: 'An error occurred while creating the user.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException(
          message: 'An error occurred while creating the user.');
    }
  }
}
