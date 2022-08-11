import 'package:flutter/material.dart';
import 'package:conversor_de_moedas/app/controllers/currency_controler.dart';
import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:conversor_de_moedas/app/views/dropdow_select.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  late HomeController homeController;

  @override
  void initState() {
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/currency-icon.png',
              width: 170,
              height: 170,
            ),
            const SizedBox(
              height: 50,
            ),

            CustomSelectWidget(
              textController: toText,
              items: homeController.currencies,
              selectedItem: homeController.toCurrency,
              onChanged: (model) {
                setState(() {
                  if (model is CurrencyModel) {
                    homeController.toCurrency = model;
                  }
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomSelectWidget(
              textController: fromText,
              items: homeController.currencies,
              selectedItem: homeController.fromCurrency,
              onChanged: (model) {
                setState(() {
                  if (model is CurrencyModel) {
                    homeController.fromCurrency = model;
                  }
                });
              },
            ),
            //Select(),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 194, 149, 16))),
              onPressed: () {
                homeController.converter();
              },
              child: const Text(
                'Converter',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
