part of 'note_detail_bloc.dart';

@immutable
sealed class NoteDetailEvent extends Equatable {
  const NoteDetailEvent();

  @override
  List<Object?> get props => <Object>[];
}

class LoadNoteDetail extends NoteDetailEvent {
  const LoadNoteDetail(this.id);
  final String id;

  @override
  List<Object?> get props => <String>[id];
}

class EditModeToggled extends NoteDetailEvent {}

class UpdateNotePressed extends NoteDetailEvent {
  const UpdateNotePressed(this.updatedNote);
  final NoteEntity updatedNote;

  @override
  List<Object?> get props => <NoteEntity>[updatedNote];
}
