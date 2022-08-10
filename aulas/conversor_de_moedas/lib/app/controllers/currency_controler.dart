import 'package:flutter/material.dart';

import '../models/currency_model.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  late TextEditingController toText = TextEditingController();
  late TextEditingController fromText = TextEditingController();

  HomeController() {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void converter() {
    String text = toText.text;
    double value = double.tryParse(text) ?? 1.0;
    double returnValue = 0;

    if (toCurrency != null) {
      if (fromCurrency == 'Real') {
        returnValue = value * toCurrency.real;
      } else if (fromCurrency == 'Dolar') {
        returnValue = value * toCurrency.dolar;
      } else if (fromCurrency == 'Euro') {
        returnValue = value * toCurrency.euro;
      } else if (fromCurrency == 'Bitcoin') {
        returnValue = value * toCurrency.bitcoin;
      }
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
