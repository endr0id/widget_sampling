import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:widget_sampling/core/utils/environment.dart';
import 'package:widget_sampling/features/todo/data/models/todo.dart';

class TodoRemoteDataSource {
  final http.Client client;

  TodoRemoteDataSource(this.client);

  // APIリクエスト実行
  Future<List<Todo>> fetchTodos() async {
    final String hostName = Environment.getHostName();
    final response = await client.get(Uri.parse('$hostName/todo'));

    if (response.statusCode == 200) {
      final List<dynamic> todosJson = json.decode(response.body);
      return todosJson.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
