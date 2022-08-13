import 'dart:developer';

import 'package:async_flutter/app/models/json_model.dart';
import 'package:dio/dio.dart';

class TodoRepository {
  final Dio dio = Dio();
  final _url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TodoModel>> fetchTodos() async {
    late final dynamic response;
    try {
      response = await dio.get(_url);
      final List lista = response.data as List;
      final List<TodoModel> todos =
          lista.map((e) => TodoModel.fromJson(e)).toList();
      return todos;
    } catch (e) {
      log(e.toString());
      Map<String, dynamic> json = {
        'userId': 0,
        'id': 0,
        'completed': false,
        'title': 'ERROR: failed to fetch!'
      };
      return [TodoModel.fromJson(json)];
    }
  }
}
