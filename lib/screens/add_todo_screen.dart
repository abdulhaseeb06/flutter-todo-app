import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';
import 'package:flutter_todo_app/providers/todo_list.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  static const routeName = '/add-todo';
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _textController = TextEditingController();
  bool _valid = true;
  void addTodo() {
    if (_textController.text.isNotEmpty) {
      final todoProvider =
          Provider.of<TodoListProvider>(context, listen: false);
      todoProvider.addTodo(Todo(
          id: DateTime.now().toString(),
          text: _textController.text,
          status: TodoStatus.Pending));
      Navigator.of(context).pop();
    } else {
      setState(() {
        _valid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _textController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Todo text',
                labelText: 'Todo text',
                errorText: !_valid ? 'Value Can\'t Be Empty' : null,
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.red[400]),
                ),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: addTodo,
              icon: Icon(Icons.add),
              label: Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
