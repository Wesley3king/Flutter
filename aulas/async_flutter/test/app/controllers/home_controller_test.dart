import 'package:async_flutter/app/controllers/home_controller.dart';
import 'package:async_flutter/app/models/json_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final HomeControler controller = HomeControler();

  test('deve retornar uma lista valida', () async {
    List<TodoModel> lista = await controller.start();

    expect(lista[1].title, 'quis ut nam facilis et officia qui');
  });
}
