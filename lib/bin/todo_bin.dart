import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo_model.dart';

// * SharedPreference key
const todoListKey = 'todo_list';

class TodoBin {
// * Utilizar dps que instancia for criada
  late SharedPreferences sharedPreferences;

  Future<List<TodoModel>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = sharedPreferences.getString(todoListKey) ?? '[]';
    final jsonDecoded = json.decode(jsonString) as List;

    return jsonDecoded
        .map(
          (eachItem) => TodoModel.fromJson(eachItem as Map<String, dynamic>),
        )
        .toList();
  }

  void saveTodoTaskList(List<TodoModel> todos) {
    final stringJson = json.encode(todos);
    sharedPreferences.setString(todoListKey, stringJson);
  }
}
