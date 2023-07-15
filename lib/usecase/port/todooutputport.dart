import '../../domain/entity.dart';

abstract class TodoOutPutPort {
  Future<void> display(List<Task> tasks);
}