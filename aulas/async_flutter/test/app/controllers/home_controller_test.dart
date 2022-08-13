import 'package:async_flutter/app/controllers/home_controller.dart';
import 'package:async_flutter/app/models/json_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final HomeControler controller = HomeControler();

  test('deve verificar se os estados estão validos', () async {
    expect(controller.state, HomeState.start);

    await controller.start();

    expect(controller.state, HomeState.sucess);

    // expect(lista[1].title, 'quis ut nam facilis et officia qui');
  });

  test('deve verificar se a requisição falhar', () async {
    expect(controller.state, HomeState.start);

    await controller.start();

    expect(controller.state, HomeState.error);

    // expect(lista[1].title, 'quis ut nam facilis et officia qui');
  });
}
