import 'package:flutter/cupertino.dart';
import 'package:todo_demo/models/todos_group_model.dart';

var starter = [
  "Monday todo",
  "Tuesday todo",
  "Wednesday todo",
];

class TodoProvider extends ChangeNotifier {
  List<TodoGroup> groups = starter.map((e) => TodoGroup(e)).toList();
  createGroup(String name) {
    var value = TodoGroup(name);
    groups.add(value);
    notifyListeners();
    // print(groups);
  }
}
