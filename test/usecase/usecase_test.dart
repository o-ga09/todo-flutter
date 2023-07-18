import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/domain/entity.dart';
import 'package:todo_app/usecase/port/todoinputport.dart';
import 'package:todo_app/usecase/port/todooutputport.dart';
import 'package:todo_app/usecase/toodousecase.dart';

import 'usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoInPutPort>()])
@GenerateNiceMocks([MockSpec<TodoOutPutPort>()])

void main() {
  group("ユースケースのテスト", () {
    test("タスクの一覧を表示する", () async {
      final inputMock = MockTodoInPutPort();
      final outputMock = MockTodoOutPutPort();
      List<Task> expected = [];
      when(inputMock.getAll()).thenAnswer((_) => Future.value(expected));
      when(outputMock.display(any));

      final usecase = TodoUsecase(inputMock,outputMock);

      final actual = await usecase.getAll(); // 非同期で待機する

      verify(inputMock.getAll()).called(1);
      verify(outputMock.display(any)).called(1);
      expect(actual, expected);
    });

   test("タスクのidで個別に取得する", () async {
      final inputMock = MockTodoInPutPort();
      final outputMock = MockTodoOutPutPort();
      final now = DateTime.now();
      final mockdata = Task(TaskId(1), TaskName(""), TaskDesc(""), TaskCreatedAt(now), TaskUpdatedAt(now));
      when(inputMock.getById(1)).thenAnswer((_) => Future.value(mockdata));
      when(outputMock.display(any));


      final usecase = TodoUsecase(inputMock,outputMock);

      final actual = await usecase.getById(1);
      final expected = ResponseData(1, "", "", now.toIso8601String(), now.toIso8601String());

      verify(inputMock.getById(1)).called(1);
      verifyNever(outputMock.display(any));
      expect(actual.id,expected.id);
      expect(actual.taskName,expected.taskName);
      expect(actual.taskDesc,expected.taskDesc);
      expect(actual.createdAt,expected.createdAt);
      expect(actual.updatedAt,expected.updatedAt);
    });

    test("タスクを登録する", () async {
      final inputMock = MockTodoInPutPort();
      final outputMock = MockTodoOutPutPort();
      final now = DateTime.now();
      final mockReturndata = ErrorMsg(1, "can not create task!");
      when(inputMock.create(any)).thenAnswer((_) => Future.value(mockReturndata));
      when(outputMock.display(any));


      final usecase = TodoUsecase(inputMock,outputMock);

      final req = RequestData("", "", now.toIso8601String(), now.toIso8601String());
      final actual = await usecase.create(req);
      const int expected = 1;

      verify(inputMock.create(any)).called(1);
      verifyNever(outputMock.display(any));
      expect(actual,expected);
    });
    test("任意の１つのタスクを編集する", () async {
      final inputMock = MockTodoInPutPort();
      final outputMock = MockTodoOutPutPort();
      final now = DateTime.now();
      final mockReturndata = ErrorMsg(1, "can not create task!");
      when(inputMock.update(any,any)).thenAnswer((_) => Future.value(mockReturndata));
      when(outputMock.display(any));


      final usecase = TodoUsecase(inputMock,outputMock);

      final arg = RequestData("", "", now.toIso8601String(), now.toIso8601String());
      final actual = await usecase.update(1,arg);
      const int expected = 1;

      verify(inputMock.update(any,any)).called(1);
      verifyNever(outputMock.display(any));
      expect(actual,expected);
    });
    test("任意の１つのタスクを削除する", () async {
      final inputMock = MockTodoInPutPort();
      final outputMock = MockTodoOutPutPort();
      final mockReturndata = ErrorMsg(1, "can not create task!");
      when(inputMock.delete(1)).thenAnswer((_) => Future.value(mockReturndata));
      when(outputMock.display(any));


      final usecase = TodoUsecase(inputMock,outputMock);

      final actual = await usecase.delete(1);
      const int expected = 1;

      verify(inputMock.delete(1)).called(1);
      verifyNever(outputMock.display(any));
      expect(actual,expected);
    });
   });
}