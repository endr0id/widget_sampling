import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:widget_sampling/features/todo/domain/entities/todo.dart';
import 'package:widget_sampling/features/todo/domain/repositories/todo_repository.dart';
import 'package:widget_sampling/features/todo/domain/usecases/todo_usecase.dart';

import 'call_method_test.mocks.dart';

@GenerateMocks([TodoRepository])
void main() {
  late TodoUseCase usecase;
  late MockTodoRepository mockTodoRepository;

  // 初期化処理(各テスト実行前に実行)
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = TodoUseCase(mockTodoRepository);
  });

  // テストデータ作成
  final testTodos = [
    Todo(id: 1, title: 'Trial and error mentality', isCompleted: true),
    Todo(id: 2, title: 'Write test code', isCompleted: true),
    Todo(
        id: 3,
        title: 'Investigate things you dont understand',
        isCompleted: true),
    Todo(id: 4, title: 'Understand the test code', isCompleted: false),
  ];

  test('リポジトリからToDoリストを返却', () async {
    // arrange(準備)
    when(mockTodoRepository.getTodos()).thenAnswer((_) async => testTodos);

    // act(実行)
    final result = await usecase();

    // assert(検証)
    expect(result, testTodos);
    verify(mockTodoRepository.getTodos()); // `getTodos` メソッドが呼ばれたか確認
    verifyNoMoreInteractions(mockTodoRepository); // 他のメソッドが呼ばれていないことを確認
  });
}
