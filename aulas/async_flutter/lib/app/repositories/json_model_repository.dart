
import 'package:async_flutter/app/models/json_model.dart';
import 'package:dio/dio.dart';

class TodoRepository {
  final Dio dio = Dio();
  final _url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TodoModel>> fetchTodos() async {
    late final dynamic response;
      response = await dio.get(_url);
      final List lista = response.data as List;
      final List<TodoModel> todos =
          lista.map((e) => TodoModel.fromJson(e)).toList();
      return todos;
  }
}
