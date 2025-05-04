import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit() : super(CompleteProfileInitial());

  Future<void> completeProfile(
      {required String gender,
      required DateTime date,
      required double weight,
      required double height}) async {
    emit(CompleteProfileLoading());
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'gender': gender,
        'date': date,
        'weight': weight,
        'height': height,
        'uid': uid,
      });
      emit(CompleteProfileSuccess());
    } catch (e) {
      emit(CompleteProfileFailure(message: e.toString()));
    }
  }
}
