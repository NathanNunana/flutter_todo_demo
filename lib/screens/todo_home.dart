import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_demo/providers/todo_provider.dart';
import 'package:todo_demo/screens/todo_group_view.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Enter group name"),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              onFieldSubmitted: (name) {
                                if (name.isNotEmpty) {
                                  context
                                      .read<TodoProvider>()
                                      .createGroup(name);
                                  Navigator.pop(context);
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "Enter group",
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.red),
                                )),
                          )
                        ],
                      ),
                    ]),
              ));
        });
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Center(
            child: RichText(
              text: TextSpan(
                  text: "Todo",
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(
                      text: "List",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        InkWell(
          onTap: _showDialog,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.blueGrey, width: 1)),
            child: Icon(
              Icons.add,
              color: Colors.blueGrey,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: _buildAppBar(),
            ),
            Expanded(
              child: TodoGroups(),
            )
          ],
        ),
      ),
    );
  }
}
