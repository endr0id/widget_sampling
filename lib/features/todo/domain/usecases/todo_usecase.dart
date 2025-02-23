import 'package:widget_sampling/features/todo/domain/repositories/todo_repository.dart';
import 'package:widget_sampling/features/todo/domain/entities/todo.dart';

class TodoUseCase {
  final TodoRepository repository;

  TodoUseCase(this.repository);

  Future<List<Todo>> call() async {
    return await repository.getTodos();
  }
}
