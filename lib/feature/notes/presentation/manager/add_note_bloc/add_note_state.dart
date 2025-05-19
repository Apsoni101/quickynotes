// add_note_state.dart
part of 'add_note_bloc.dart';

sealed class AddNoteState extends Equatable {
  const AddNoteState();

  @override
  List<Object> get props => <Object>[];
}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {
  const AddNoteSuccess({required this.id});
  final String id;

  @override
  List<Object> get props => <String>[id];
}

class AddNoteFailure extends AddNoteState {
  const AddNoteFailure({required this.message});
  final String message;

  @override
  List<Object> get props => <String>[message];
}
