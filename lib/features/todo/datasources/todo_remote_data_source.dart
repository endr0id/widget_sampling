import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:widget_sampling/features/todo/models/todo.dart';

class TodoRemoteDataSource {
  final http.Client client;

  TodoRemoteDataSource(this.client);

  // APIリクエスト実行
  Future<List<Todo>> fetchTodos() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      final List<dynamic> todosJson = json.decode(response.body);
      return todosJson.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
