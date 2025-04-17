import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_rami/data/note_model.dart';
import 'package:note_app_rami/logic/create_note/createnote_state.dart';

class CreateNoteCubit extends Cubit<CreateNoteStates> {
  CreateNoteCubit(this.firestore): super(CreateNoteInitialStates());

  FirebaseFirestore firestore ;

  Future CreateNoteData(NoteModel data) async {

    emit(CreateNoteLoadingState());
    try {
      await firestore.collection('notes').add(data.toJson());
      emit(CreateNoteSucessState());

    }catch (e) {
      emit(CreateNoteErrorState(e.toString()));

    }
  }



}