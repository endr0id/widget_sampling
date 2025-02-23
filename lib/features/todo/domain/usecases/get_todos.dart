import 'package:widget_sampling/features/todo/domain/repositories/todo_repository.dart';
import 'package:widget_sampling/features/todo/domain/entities/todo.dart';

class GetTodos {
  final TodoRepository repository;

  GetTodos(this.repository);

  Future<List<Todo>> execute() {
    return repository.getTodos();
  }
}
