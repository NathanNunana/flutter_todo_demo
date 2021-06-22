import 'package:flutter/material.dart';
import 'package:todo_demo/screens/todo_home.dart';
import 'dart:math';

class TodoGroup {
  String title;
  late Color color;
  List<Todo> todo = [];
  late DateTime date;
  TodoGroup(this.title)
      : color = Color.fromARGB(Random().nextInt(255), Random().nextInt(100),
            Random().nextInt(100), Random().nextInt(100)),
        date = DateTime.now();
}
