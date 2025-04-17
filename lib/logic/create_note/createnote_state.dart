abstract class CreateNoteStates {}

class CreateNoteInitialStates extends CreateNoteStates {}

class CreateNoteLoadingState extends CreateNoteStates {}

class CreateNoteSucessState extends CreateNoteStates {}


class CreateNoteErrorState extends CreateNoteStates {

  final String error;
  CreateNoteErrorState(this.error);

}



