import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:widget_sampling/features/todo/domain/entities/todo.dart'
    as entity;

part 'todo.freezed.dart';
part 'todo.g.dart';

@Freezed() // todo.freezed.dartにカスタムメソッドを追加の為、定義
class Todo with _$Todo {
  const factory Todo({
    required int userId,
    required int id,
    required String title,
    required bool completed,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}

// toDomain() を拡張
extension TodoMapper on Todo {
  // データモデルからエンティティに変換
  entity.Todo toDomain() {
    return entity.Todo(id: id, title: title, isCompleted: completed);
  }
}
