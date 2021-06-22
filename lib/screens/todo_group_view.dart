import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_demo/models/todos_group_model.dart';
import 'package:todo_demo/providers/todo_provider.dart';

class TodoGroups extends StatefulWidget {
  @override
  _TodoGroupsState createState() => _TodoGroupsState();
}

class _TodoGroupsState extends State<TodoGroups> {
  final Random random = Random();

  Widget _buildEmptyGroup() {
    return Container(
      child: Center(
        child: Text(
          "No Group Added",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTodoGroups(List<TodoGroup> groups) {
    return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        physics: BouncingScrollPhysics(),
        childAspectRatio: 5 / 6,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        children: groups.asMap().keys.map((e) {
          var group = groups.elementAt(e);
          return _buildTodoGroupCard(group);
        }).toList());
  }

  Widget _buildTodoGroupCard(TodoGroup group) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            colors: [group.color, group.color.withRed(100)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 25,
            height: 25,
            margin: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CircularProgressIndicator(
                    value: random.nextDouble(),
                    color: Colors.white54,
                  ),
                ),
                Container(
                  child: Text("20"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "0/0 completed",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                  color: Colors.white30,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Text(
              group.title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 2, left: 8),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                right: 20,
              ),
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white24),
              child: Text("+ open"),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var groups = context.read<TodoProvider>().groups;
    var _conditionalBuild =
        groups.isEmpty ? _buildEmptyGroup() : _buildTodoGroups(groups);
    return Container(
      child: _conditionalBuild,
    );
  }
}
