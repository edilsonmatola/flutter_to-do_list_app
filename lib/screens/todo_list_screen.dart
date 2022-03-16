import 'package:flutter/material.dart';

class ToDoListScreen extends StatelessWidget {
  ToDoListScreen({Key? key}) : super(key: key);

  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
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
                onPressed: () {},
                child: Icon(
                  Icons.add_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
