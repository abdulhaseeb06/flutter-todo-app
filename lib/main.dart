import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
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
