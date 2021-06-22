import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_demo/providers/todo_provider.dart';
import 'package:todo_demo/screens/todo_home.dart';
import 'package:todo_demo/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodoProvider(),
        )
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: scaffoldBackground,
        ),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF1A1A2E),
        ),
        routes: {
          "/": (BuildContext context) => Todo(),
        },
      ),
    );
  }
}
