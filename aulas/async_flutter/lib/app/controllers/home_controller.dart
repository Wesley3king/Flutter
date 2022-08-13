import 'package:async_flutter/app/models/json_model.dart';
import 'package:async_flutter/app/repositories/json_model_repository.dart';

class HomeControler {
  List<TodoModel> todos = [];
  final TodoRepository repository = TodoRepository();

  Future<List<TodoModel>> start() async {
    List<TodoModel> response = await repository.fetchTodos();

    return response;
  }
}
