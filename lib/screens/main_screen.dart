import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';
import 'package:flutter_todo_app/widgets/todo_list.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.pending_actions),
                text: 'Pending',
              ),
              Tab(
                icon: Icon(Icons.check),
                text: 'Completed',
              ),
            ],
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          child: TabBarView(
            children: [
              Container(
                child: TodoList(
                  status: TodoStatus.Pending,
                ),
              ),
              Container(
                child: TodoList(
                  status: TodoStatus.Completed,
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
