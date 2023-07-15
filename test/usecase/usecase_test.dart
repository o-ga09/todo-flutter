import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/domain/entity.dart';
import 'package:todo_app/usecase/port/todoinputport.dart';
import 'package:todo_app/usecase/toodousecase.dart';

import 'usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoInPutPort>()])

void main() {
  group("ユースケースのテスト", () {
    test("タスクの一覧を表示する", () async {
      final mock = MockTodoInPutPort();
      List<Task> expected = [];
      when(mock.getAll()).thenAnswer((_) => Future.value(expected));

      final usecase = TodoUsecase(mock);

      final actual = await usecase.getAll(); // 非同期で待機する

      verify(mock.getAll()).called(1);
      expect(actual, expected);
    });

   test("タスクのidで個別に取得する", () async {
      final mock = MockTodoInPutPort();
      final now = DateTime.now();
      final mockdata = Task(TaskId(1), TaskName(""), TaskDesc(""), TaskCreatedAt(now), TaskUpdatedAt(now));
      when(mock.getById(1)).thenAnswer((_) => Future.value(mockdata));


      final usecase = TodoUsecase(mock);

      final actual = await usecase.getById(1);
      final expected = ResponseData(1, "", "", now.toIso8601String(), now.toIso8601String());

      verify(mock.getById(1)).called(1);
      expect(actual.id,expected.id);
      expect(actual.taskName,expected.taskName);
      expect(actual.taskDesc,expected.taskDesc);
      expect(actual.createdAt,expected.createdAt);
      expect(actual.updatedAt,expected.updatedAt);
    });

    test("タスクを登録する", () async {
      final mock = MockTodoInPutPort();
      final now = DateTime.now();
      final mockReturndata = ErrorMsg(1, "can not create task!");
      when(mock.create(any)).thenAnswer((_) => Future.value(mockReturndata));


      final usecase = TodoUsecase(mock);

      final req = RequestData("", "", now.toIso8601String(), now.toIso8601String());
      final actual = await usecase.create(req);
      const int expected = 1;

      verify(mock.create(any)).called(1);
      expect(actual,expected);
    });
    test("任意の１つのタスクを編集する", () async {
      final mock = MockTodoInPutPort();
      final now = DateTime.now();
      final mockReturndata = ErrorMsg(1, "can not create task!");
      when(mock.update(any,any)).thenAnswer((_) => Future.value(mockReturndata));


      final usecase = TodoUsecase(mock);

      final arg = RequestData("", "", now.toIso8601String(), now.toIso8601String());
      final actual = await usecase.update(1,arg);
      const int expected = 1;

      verify(mock.update(any,any)).called(1);
      expect(actual,expected);
    });
    test("任意の１つのタスクを削除する", () async {
      final mock = MockTodoInPutPort();
      final mockReturndata = ErrorMsg(1, "can not create task!");
      when(mock.delete(1)).thenAnswer((_) => Future.value(mockReturndata));


      final usecase = TodoUsecase(mock);

      final actual = await usecase.delete(1);
      const int expected = 1;

      verify(mock.delete(1)).called(1);
      expect(actual,expected);
    });
   });
}