import 'package:async_flutter/app/models/json_model.dart';
import 'package:dio/dio.dart';

class TodoRepository {
  final dio = Dio();
  final _url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TodoModel>?> fetchTodos() async {
    late final dynamic response;
    try {
      response = await dio.get(_url);
      final List lista = response.data as List;
      
      List<TodoModel> todos = [];

      for (var e in lista) {
        final todo = TodoModel.fromJson(e);
        todos.add(todo);
      }
      return todos;
    } catch (e) {
      return null;
    }
  }
}
