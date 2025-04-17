import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_rami/logic/Login_cubit/state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(): super(LoginInitialStates());


  Future LoginEmailandPassword(String useremail, String userpassword,  ) async {

    emit(LoginLoadingState());
    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(email: useremail, password: userpassword);
      emit(LoginSucessState());



    }
    catch (e) {
      emit(LoginErrorState(e.toString()));

    }

  }

  Future contineWithGoogle() async {

    emit(LoginLoadingState());

    try {

      await FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider());
      emit(LoginSucessState());



    }
    catch (e) {
      emit(LoginErrorState(e.toString()));

    }

  }






}