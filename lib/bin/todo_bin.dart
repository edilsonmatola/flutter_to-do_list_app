import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo_model.dart';

class TodoBin {
  TodoBin() {
    SharedPreferences.getInstance().then(
      (value) => sharedPreferences = value,
    );
  }
// * Utilizar dps que instancia for criada
  late SharedPreferences sharedPreferences;

  void saveTodoTaskList(List<TodoModel> todos) {
    final stringJson = json.encode(todos);
    sharedPreferences.setString('todo_list', stringJson);
  }
}
