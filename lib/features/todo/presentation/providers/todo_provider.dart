import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_sampling/core/utils/providers.dart';
import 'package:widget_sampling/features/todo/data/datasources/todo_remote_data_source.dart';
import 'package:widget_sampling/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:widget_sampling/features/todo/domain/entities/todo.dart';
import 'package:widget_sampling/features/todo/domain/repositories/todo_repository.dart';
import 'package:widget_sampling/features/todo/domain/usecases/todo_usecase.dart';

// 依存性注入(DI)
final todoRemoteDataSourceProvider =
    Provider((ref) => TodoRemoteDataSource(ref.watch(httpClientProvider)));

final todoRepositoryProvider = Provider<TodoRepository>(
    (ref) => TodoRepositoryImpl(ref.watch(todoRemoteDataSourceProvider)));

final todoUseCaseProvider =
    Provider((ref) => TodoUseCase(ref.watch(todoRepositoryProvider)));

final todoProvider =
    StateNotifierProvider<TodoProvider, AsyncValue<List<Todo>>>((ref) {
  final todoUseCase = ref.watch(todoUseCaseProvider);
  return TodoProvider(todoUseCase);
});

class TodoProvider extends StateNotifier<AsyncValue<List<Todo>>> {
  final TodoUseCase _todoUseCase;

  TodoProvider(this._todoUseCase) : super(const AsyncValue.loading()) {
    _initialized();
  }

  Future<void> _initialized() async {
    try {
      final todos = await _todoUseCase();
      state = AsyncValue.data(todos);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
