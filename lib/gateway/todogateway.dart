import 'package:todo_app/usecase/port/todoinputport.dart';
import 'package:todo_app/usecase/toodousecase.dart';

import '../domain/entity.dart';
import '../driver/tododriver.dart';

class TodoGateway implements TodoInPutPort  {
  final TodoDriver todoDriver;

  TodoGateway(this.todoDriver);

  @override
  Future<List<Task>> getAll() async {
    final List<DriverTask> res = await todoDriver.getAll();

    return List.generate(res.length, (i) {
      return Task(
        TaskId(res[i].id),
        TaskName(res[i].taskName),
        TaskDesc(res[i].taskDesc),
        TaskCreatedAt(res[i].createdAt),
        TaskUpdatedAt(res[i].updatedAt)
      );
    });
  }

  @override
  Future<Task> getById(int id) async {
    final res = await todoDriver.getById(id);
    final result = Task(TaskId(res.id), TaskName(res.taskName), TaskDesc(res.taskDesc), TaskCreatedAt(res.createdAt), TaskUpdatedAt(res.updatedAt));
    
    return result;
  }

  @override
  Future<ErrorMsg> create(EditTask data) async {
    final driverdata = DriverEdit(data.taskName.value, data.taskDesc.value, data.updatedAt.value, data.updatedAt.value);
    final res = await todoDriver.create(driverdata);

    return ErrorMsg(res.errno,"success!");
  }
  
  @override
  Future<ErrorMsg> delete(int id) async {
    final res = await todoDriver.delete(id);

    return ErrorMsg(res.errno,"success!");
  }
  
  @override
  Future<ErrorMsg> update(int id, EditTask data) async {
    final driverData = DriverEdit(data.taskName.value, data.taskDesc.value, data.createdAt.value, data.updatedAt.value);
    final res = await todoDriver.update(id, driverData);

    return ErrorMsg(res.errno, "success!");
  }
  
}