import 'package:quicky_notes/feature/notes/domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  const NoteModel({
    required super.id,
    required super.title,
    required super.content,
    required super.createdAt,
  });

  factory NoteModel.fromMap(
    final Map<String, dynamic> map, {
    required final String id,
  }) => NoteModel(
    id: id,
    title: map['title'] ?? '',
    content: map['content'] ?? '',
    createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
  );

  factory NoteModel.fromEntity(final NoteEntity entity) => NoteModel(
    id: entity.id,
    title: entity.title,
    content: entity.content,
    createdAt: entity.createdAt,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    'title': title,
    'content': content,
    'createdAt': createdAt.toString(),
  };
}
