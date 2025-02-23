import 'package:widget_sampling/features/todo/data/datasources/todo_remote_data_source.dart';
import 'package:widget_sampling/features/todo/domain/repositories/todo_repository.dart';
import 'package:widget_sampling/features/todo/data/models/todo.dart'; // toDomain()を読み込む為にimport
import 'package:widget_sampling/features/todo/domain/entities/todo.dart'
    as entities; // data/models/todo.dartとクラスを区別する為、asプレフィックス定義

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  TodoRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<entities.Todo>> getTodos() async {
    final todos = await remoteDataSource.fetchTodos();

    // データモデルからエンティティへ変換
    return todos.map((todoModel) => todoModel.toDomain()).toList();
  }
}
