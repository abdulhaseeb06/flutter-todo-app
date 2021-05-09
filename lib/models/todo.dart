import 'package:flutter/material.dart';

enum TodoStatus { Pending, Completed }

class Todo {
  final String id;
  final String text;
  TodoStatus status;

  Todo({@required this.id, @required this.text, @required this.status});
}
