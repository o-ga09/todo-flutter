import 'package:todo_app/domain/entity.dart';
import 'package:todo_app/state/todostate.dart';
import 'package:todo_app/usecase/port/todooutputport.dart';

class TodoPresenterImpl implements TodoOutPutPort {
  final TodoState todoState;

  TodoPresenterImpl(this.todoState);
  @override
  Future<void> display(List<Task> tasks) async {
    todoState.setTask(tasks);
  }
}