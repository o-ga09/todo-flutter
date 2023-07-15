class Task {
  final TaskId taskId;
  final TaskName taskName;
  final TaskDesc taskDesc;
  final TaskCreatedAt createdAt;
  final TaskUpdatedAt updatedAt;

  Task(this.taskId, this.taskName, this.taskDesc, this.createdAt, this.updatedAt);
}

class TaskId {
  final int value;

  TaskId(this.value);
}

class TaskName {
  String value;

  TaskName(this.value);
}

class TaskDesc {
  final String value;

  TaskDesc(this.value);
}

class TaskCreatedAt {
  final DateTime value;

  TaskCreatedAt(this.value);

  String toString(){
    return value.toIso8601String();
  }
}

class TaskUpdatedAt {
  final DateTime value;

  TaskUpdatedAt(this.value);

  String toString() {
    return value.toIso8601String();
  }
}

class EditTask {
  final TaskName taskName;
  final TaskDesc taskDesc;
  final TaskCreatedAt createdAt;
  final TaskUpdatedAt updatedAt;

  EditTask(this.taskName, this.taskDesc, this.createdAt, this.updatedAt);
}