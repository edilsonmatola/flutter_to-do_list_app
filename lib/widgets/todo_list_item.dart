import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/todo_model.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({Key? key, required this.todoTask}) : super(key: key);

  final TodoModel todoTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('dd/MM/yyyy - HH:mm').format(todoTask.dateTime),
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              todoTask.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
