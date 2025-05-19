import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  const NoteEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;

  @override
  List<Object?> get props => <Object>[id, title, content, createdAt];

  NoteEntity copyWith({
    final String? id,
    final String? title,
    final String? content,
    final DateTime? createdAt,
  }) => NoteEntity(
    id: id ?? this.id,
    title: title ?? this.title,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
  );
}
