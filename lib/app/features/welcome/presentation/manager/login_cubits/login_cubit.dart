import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/features/welcome/presentation/manager/login_cubits/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  String x = "dsdsd";
  Future<void> LoginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = FirebaseAuth.instance.currentUser!.uid;

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {}
      emit(LoginFailure(errMessage: "Wrong password provided for that user."));
    } catch (e) {
      emit(LoginFailure(errMessage: e.toString()));
    }
  }
}
