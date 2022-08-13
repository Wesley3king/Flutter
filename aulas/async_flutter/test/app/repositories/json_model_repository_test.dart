import 'package:async_flutter/app/models/json_model.dart';
import 'package:async_flutter/app/repositories/json_model_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository_json = TodoRepository();
  print('comecou');
  test('deve trazer uma lista de TodoModel', () async {
    final response = await repository_json.fetchTodos();

    if (response != null) {
      print(response[1].title);
      print(response is List<TodoModel>);

      expect(response[1].title, 'quis ut nam facilis et officia qui');
    } else {
      print(response);
    }
  });
}
