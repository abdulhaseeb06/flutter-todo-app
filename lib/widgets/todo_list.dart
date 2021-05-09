import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';
import 'package:flutter_todo_app/providers/todo_list.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  final TodoStatus status;
  TodoList({this.status});
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoListProvider>(context);
    final _todoList = this.status == TodoStatus.Completed
        ? todoProvider.getCompletedTodoList
        : todoProvider.getPendingTodoList;
    final totlaItems = _todoList.length;
    return _todoList.length <= 0
        ? Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.topCenter,
            child: Text(
              'No todos found!',
              style: Theme.of(context).textTheme.headline4,
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(5),
                child: ListTile(
                  leading: Icon(
                    Icons.pending_actions,
                    color: Colors.white,
                  ),
                  title: Text(
                    _todoList[index].text,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: _todoList[index].status == TodoStatus.Pending
                      ? Text(
                          'Pending',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(
                          'Completed',
                          style: TextStyle(color: Colors.white),
                        ),
                  key: ValueKey(_todoList[index].id),
                ),
              );
            },
            itemCount: totlaItems,
          );
  }
}
