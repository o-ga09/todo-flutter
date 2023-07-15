import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/domain/entity.dart';
import 'package:todo_app/driver/tododriver.dart';
import 'package:todo_app/gateway/todogateway.dart';
import 'package:todo_app/usecase/toodousecase.dart';

import 'gateway_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoDriver>()])

void main() {
  group("ゲートウェイのテスト", () {
    test("タスクの一覧を取得する", () async {
      final mock = MockTodoDriver();
      Future<List<DriverTask>> mockdata = Future.value([]);
      when(mock.getAll()).thenAnswer((_) => Future.value(mockdata));
      
      final gateway = TodoGateway(mock);
      final actual = await gateway.getAll();
      List<Task> expected  = [];

      verify(mock.getAll()).called(1);
      expect(actual, expected);
    });

    test("任意のタスクを取得する", () async {
      final mock = MockTodoDriver();
      final now = DateTime.now();
      final mockdata = DriverTask(1, "", "", now, now);
      when(mock.getById(1)).thenAnswer((_) => Future.value(mockdata));
      
      final gateway = TodoGateway(mock);
      final Task actual = await gateway.getById(1);
      final expected = Task(TaskId(1), TaskName(""), TaskDesc(""), TaskCreatedAt(now), TaskUpdatedAt(now));

      verify(mock.getById(1)).called(1);
      expect(actual.taskId.value, expected.taskId.value);
      expect(actual.taskName.value, expected.taskName.value);
      expect(actual.taskDesc.value, expected.taskDesc.value);
      expect(actual.createdAt.value, expected.createdAt.value);
      expect(actual.updatedAt.value, expected.updatedAt.value);
    });

    test("タスクをDBに登録する", () async {
      final mock = MockTodoDriver();
      final now = DateTime.now();
      final mockdata = DriverMsg(0);
      when(mock.create(any)).thenAnswer((_) => Future.value(mockdata));
      
      final gateway = TodoGateway(mock);
      final arg = EditTask(TaskName(""), TaskDesc(""), TaskCreatedAt(now), TaskUpdatedAt(now));
      final ErrorMsg actual = await gateway.create(arg);
      final expected = ErrorMsg(0, "success!");

      verify(mock.create(any)).called(1);
      expect(actual.errno, expected.errno);
      expect(actual.Msg, expected.Msg);
    });

    test("任意の１つのタスクを編集する", () async {
      final mock = MockTodoDriver();
      final now = DateTime.now();
      final mockdata = DriverMsg(0);
      when(mock.update(any,any)).thenAnswer((_) => Future.value(mockdata));
      
      final gateway = TodoGateway(mock);
      final arg = EditTask(TaskName(""), TaskDesc(""), TaskCreatedAt(now), TaskUpdatedAt(now));
      final ErrorMsg actual = await gateway.update(1,arg);
      final expected = ErrorMsg(0, "success!");

      verify(mock.update(any,any)).called(1);
      expect(actual.errno, expected.errno);
      expect(actual.Msg, expected.Msg);
    });

    test("任意の１つのタスクを削除する", () async {
      final mock = MockTodoDriver();
      final mockdata = DriverMsg(0);
      when(mock.delete(any)).thenAnswer((_) => Future.value(mockdata));
      
      final gateway = TodoGateway(mock);
      final ErrorMsg actual = await gateway.delete(1);
      final expected = ErrorMsg(0, "success!");

      verify(mock.delete(any)).called(1);
      expect(actual.errno, expected.errno);
      expect(actual.Msg, expected.Msg);
    });
   });
}