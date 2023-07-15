import 'package:flutter/foundation.dart';
import 'package:todo_app/usecase/port/todoinputport.dart';

import '../domain/entity.dart';

class TodoUsecase {
  final TodoInPutPort todoInPutPort;

  TodoUsecase(this.todoInPutPort);
  
  Future<List<ResponseData>> getAll() async {
    final List<Task> res = await todoInPutPort.getAll();

    return List.generate(res.length, (i) {
      return ResponseData(
        res[i].taskId.value,
        res[i].taskName.value,
        res[i].taskDesc.value,
        res[i].createdAt.value.toIso8601String(),
        res[i].updatedAt.value.toIso8601String()
      );
    });
  }

  Future<ResponseData> getById(int id) async {
    final Task res = await todoInPutPort.getById(id);
    return ResponseData(res.taskId.value,res.taskName.value,res.taskDesc.value,res.createdAt.toString(),res.updatedAt.toString());
  }

  Future<int> create(RequestData req) async {
    final editData = EditTask(TaskName(req.taskName), TaskDesc(req.taskDesc), TaskCreatedAt(req.toDateTime(req.createdAt)), TaskUpdatedAt(req.toDateTime(req.updatedAt)));
    final ErrorMsg res = await todoInPutPort.create(editData);

    debugPrint("err no = ${res.errno.toString()} : message : ${res.Msg}");

    return res.errno;
  }

  Future<int> update(int id, RequestData arg) async {
    final editData = EditTask(TaskName(arg.taskName), TaskDesc(arg.taskDesc), TaskCreatedAt(arg.toDateTime(arg.createdAt)), TaskUpdatedAt(arg.toDateTime(arg.updatedAt)));
    final ErrorMsg res = await todoInPutPort.update(id, editData);

    debugPrint("err no = ${res.errno.toString()} message : ${res.Msg}");

    return res.errno;
  }

  Future<int> delete(int id) async {
    final ErrorMsg res = await todoInPutPort.delete(id);

    return res.errno;
  }
}

class ResponseData {
  final int id;
  final String taskName;
  final String taskDesc;
  final String createdAt;
  final String updatedAt;

  ResponseData(this.id, this.taskName, this.taskDesc, this.createdAt, this.updatedAt);
}

class RequestData {
  final String taskName;
  final String taskDesc;
  final String createdAt;
  final String updatedAt;

  RequestData(this.taskName, this.taskDesc, this.createdAt, this.updatedAt);

  DateTime toDateTime(String datetime) {
    return DateTime.parse(datetime);
  }
}

class ErrorMsg {
  final int errno;
  final String Msg;

  ErrorMsg(this.errno,this.Msg);
}