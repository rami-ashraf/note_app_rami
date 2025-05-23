import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_rami/logic/signup_cubit/state.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(): super(SignUpInitialStates());


  Future signUp(String useremail, String userpassword,  ) async {

    emit(SignUpLoadingState());
    try {

      FirebaseAuth.instance.createUserWithEmailAndPassword(email: useremail, password: userpassword);
      emit(SignUpSucessState());



    }
        catch (e) {
    emit(SignUpErrorState(e.toString()));
    }
  }

    Future contineWithGoogle() async {

      emit(SignUpLoadingState());

      try {

        await FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider());
        emit(SignUpSucessState());



      }
      catch (e) {
        emit(SignUpErrorState(e.toString()));

      }


    }}







