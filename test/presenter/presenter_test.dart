import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/domain/entity.dart';
import 'package:todo_app/presenter/todopresenter.dart';
import 'package:todo_app/state/todostate.dart';

import 'presenter_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoState>()])

void mian() {
  group("プレゼンターのテスト", () {
    test("ステートを更新する", () async {
      final mock = MockTodoState();
      when(mock.setTask(any));

      final presenter = TodoPresenterImpl();
      final List<Task> arg = [];
      final _ = await presenter.display(arg);
      
      verify(mock.setTask(any)).called(1);
   });
  });
}