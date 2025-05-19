part of 'add_note_bloc.dart';

sealed class AddNoteEvent extends Equatable {
  const AddNoteEvent();

  @override
  List<Object> get props => <Object>[];
}

class AddNoteRequested extends AddNoteEvent {
  const AddNoteRequested(this.note);
  final NoteEntity note;

  @override
  List<Object> get props => <Object>[note];
}
