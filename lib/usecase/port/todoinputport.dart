import '../../domain/entity.dart';
import '../toodousecase.dart';

abstract class TodoInPutPort {
  Future<List<Task>> getAll();
  Future<Task> getById(int id);
  Future<ErrorMsg> create(EditTask data);
  Future<ErrorMsg> update(int id, EditTask data);
  Future<ErrorMsg> delete(int id);
}