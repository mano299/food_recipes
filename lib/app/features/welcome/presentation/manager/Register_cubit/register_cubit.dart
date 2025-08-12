import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> RegisterUser({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    emit(RegisterLoading());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        "FullName": name,
        "PhoneNumber": phoneNumber,
        "Email": email,
        "createdAt": FieldValue.serverTimestamp(),
      });
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(
            errMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: e.toString()));
    }
  }
}
