part of 'notes_listing_bloc.dart';

sealed class NotesListState extends Equatable {
  const NotesListState();

  @override
  List<Object> get props => <Object>[];
}

class NotesListInitial extends NotesListState {}

class NotesListLoading extends NotesListState {}

class NotesListLoaded extends NotesListState {
  const NotesListLoaded({required this.notes});
  final List<NoteEntity> notes;

  @override
  List<Object> get props => <List<NoteEntity>>[notes];
}

class NotesListFailure extends NotesListState {
  const NotesListFailure({required this.message});
  final String message;

  @override
  List<Object> get props => <String>[message];
}
