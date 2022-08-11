import 'package:conversor_de_moedas/app/controllers/currency_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TextEditingController toText = TextEditingController();
  late TextEditingController fromText = TextEditingController();
  final HomeController homeController =
      HomeController(toText: toText, fromText: fromText);

  test('deve converter de real para dolar', () {
    toText.text = '2.0';
    fromText;
    homeController.converter();
    print(fromText.value);
    expect(fromText, '0.36');
  });
}
