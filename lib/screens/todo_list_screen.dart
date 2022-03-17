import 'package:flutter/material.dart';

import '../models/todo_model.dart';
import '../widgets/todo_list_item.dart';

class ToDoListScreen extends StatefulWidget {
  ToDoListScreen({Key? key}) : super(key: key);

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final TextEditingController todoTaskController = TextEditingController();

  List<TodoModel> todoTasks = [];

  TodoModel?
      deletedTodoTask; //Nullable because initially we don't have any task

  int?
      deletedTodoTaskPosition; //Retrieve the last deleted task position in the list

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoTaskController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Write a task...',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff00d7f3),
                        padding: EdgeInsets.all(14),
                      ),
                      onPressed: () {
                        // * Retrieving the inserted form field text
                        final taskTitle = todoTaskController.text;
                        setState(() {
                          final newTask = TodoModel(
                            title: taskTitle,
                            dateTime: DateTime.now(),
                          );
                          // * Render the screen to add the list
                          todoTasks.add(newTask);
                        });
                        // * Clears text field after pressing the ADD button
                        todoTaskController.clear();
                      },
                      child: Icon(
                        Icons.add_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Flexible(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      for (TodoModel todo in todoTasks)
                        TodoListItem(
                          todoTask: todo,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'You have ${todoTasks.length} pending tasks.',
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff00d7f3),
                        padding: EdgeInsets.all(14),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Clear',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// * Deleting a task
  void onDelete(TodoModel todo) {
    deletedTodoTask = todo;

    deletedTodoTaskPosition = todoTasks.indexOf(todo);

    setState(() {
      // Removing from  the task from the list
      todoTasks.remove(todo);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); //Removing the last snackbar
// * Undo functionality through snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          textColor: const Color(0xff00d7f3),
          label: 'Undo',
          onPressed: () {
            setState(() {
              todoTasks.insert(deletedTodoTaskPosition!, deletedTodoTask!);
            });
          },
        ),
        content: Text(
          '${todo.title} removed successfully!',
        ),
      ),
    );
  }
}
