import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:widget_sampling/features/todo/data/datasources/todo_remote_data_source.dart';
import 'package:widget_sampling/features/todo/data/models/todo.dart';

import 'todo_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late TodoRemoteDataSource dataSource;
  late MockClient mockClient;
  String url = 'https://jsonplaceholder.typicode.com/todos';

  setUp(() {
    mockClient = MockClient();
    dataSource = TodoRemoteDataSource(mockClient);
  });

  final testResponse = '''
    [
      {"userId": 1, "id": 1, "title": "Test Todo 1", "completed": true},
      {"userId": 1, "id": 2, "title": "Test Todo 2", "completed": false}
    ]
  ''';

  test('fetchTodo()のレスポンスが200の時、List<Todo>を返却', () async {
    // arrange
    when(mockClient.get(Uri.parse(url)))
        .thenAnswer((_) async => http.Response(testResponse, 200));

    // act
    final result = await dataSource.fetchTodos();

    // assert

    // レスポンス内容の検証
    expect(result, isA<List<Todo>>()); // レスポンスの型チェック
    expect(result.length, 2);
    expect(result[0].title, 'Test Todo 1');
    expect(result[1].title, 'Test Todo 2');
    verify(mockClient.get(Uri.parse(url))); // 1回だけの呼び出しかのチェック
    verifyNoMoreInteractions(mockClient); // 不要なHTTPリクエストが発生していないチェック
  });

  test('fetchTodo()のレスポンスが200以外の時、例外を投げる', () async {
    // arrange
    when(mockClient.get(Uri.parse(url)))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    // act & assert
    expect(() => dataSource.fetchTodos(), throwsException);
    verify(mockClient.get(Uri.parse(url)));
    verifyNoMoreInteractions(mockClient);
  });
}
