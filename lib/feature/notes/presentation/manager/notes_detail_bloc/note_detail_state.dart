part of 'note_detail_bloc.dart';

@immutable
sealed class NoteDetailState extends Equatable {
  const NoteDetailState();

  @override
  List<Object?> get props => <Object>[];
}

class NoteDetailInitial extends NoteDetailState {
  const NoteDetailInitial();
}

class NoteDetailLoading extends NoteDetailState {
  const NoteDetailLoading();
}

class NoteDetailLoaded extends NoteDetailState {
  const NoteDetailLoaded(this.note, {this.isEditing = false});
  final NoteEntity note;
  final bool isEditing;

  @override
  List<Object?> get props => <Object>[note, isEditing];

  NoteDetailLoaded copyWith({final NoteEntity? note, final bool? isEditing}) =>
      NoteDetailLoaded(
        note ?? this.note,
        isEditing: isEditing ?? this.isEditing,
      );
}

class NoteDetailUpdated extends NoteDetailState {
  const NoteDetailUpdated();
}

class NoteDetailError extends NoteDetailState {
  const NoteDetailError(this.message);
  final String message;

  @override
  List<Object?> get props => <String>[message];
}
