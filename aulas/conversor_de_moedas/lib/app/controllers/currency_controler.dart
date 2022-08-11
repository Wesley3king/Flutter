import 'package:flutter/material.dart';

import '../models/currency_model.dart';

class HomeController {
  late List<CurrencyModel> currencies = CurrencyModel.getCurrencies();

  late CurrencyModel toCurrency = currencies[0];
  late CurrencyModel fromCurrency = currencies[1];

  late TextEditingController toText;
  late TextEditingController fromText;

  HomeController({required this.toText, required this.fromText}); 

  void converter() {
    String text = toText.text;
    double value = double.tryParse(text) ?? 1.0;
    double returnValue = 0.0;

    if (fromCurrency.name == 'Real') {
      returnValue = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      returnValue = value * toCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      returnValue = value * toCurrency.euro;
    } else if (fromCurrency.name == 'Bitcoin') {
      returnValue = value * toCurrency.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
