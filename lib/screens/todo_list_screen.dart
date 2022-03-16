import 'package:flutter/material.dart';

class ToDoListScreen extends StatefulWidget {
  ToDoListScreen({Key? key}) : super(key: key);

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final TextEditingController todoTaskController = TextEditingController();

  List<String> todoTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      final task = todoTaskController.text;
                      setState(() {
                        // * Render the screen to add the list
                        todoTasks.add(task);
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
                    for (String todo in todoTasks)
                      ListTile(
                        title: Text(
                          todo,
                        ),
                        onTap: () {
                          debugPrint('Task: $todo');
                        },
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
    );
  }
}
