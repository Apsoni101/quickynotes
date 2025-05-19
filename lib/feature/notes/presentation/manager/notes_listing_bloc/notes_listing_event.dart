part of 'notes_listing_bloc.dart';

sealed class NotesListEvent extends Equatable {
  const NotesListEvent();

  @override
  List<Object> get props => <Object>[];
}

class NotesListStarted extends NotesListEvent {}

class DeleteNoteRequested extends NotesListEvent {
  const DeleteNoteRequested(this.id);
  final String id;

  @override
  List<Object> get props => <String>[id];
}
