import 'package:flutter/cupertino.dart';
import '../domain/entity.dart';

class TodoState extends ChangeNotifier {
  List<Task> tasks = [];

  void setTask(List<Task> t) {
    tasks = t;
    notifyListeners();
  }
}