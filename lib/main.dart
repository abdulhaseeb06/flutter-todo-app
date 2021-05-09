import 'package:flutter/material.dart';
import 'package:flutter_todo_app/providers/todo_list.dart';
import 'package:flutter_todo_app/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => TodoListProvider(),
        ),
      ],
      child: MaterialApp(
        home: MainScreen(),
        theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 28,
            ),
            headline2: TextStyle(
              fontSize: 24,
            ),
            headline3: TextStyle(
              fontSize: 20,
            ),
            headline4: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: Container(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Add task'),
        ),
      ),
    );
  }
}
