import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CustomSelectWidget extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel? selectedItem;
  final TextEditingController textController;
  final void Function(CurrencyModel?) onChanged;

  const CustomSelectWidget(
      {super.key,
      required this.items,
      required this.textController,
      required this.onChanged,
      required this.selectedItem
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                height: 57,
                child: DropdownButton<CurrencyModel>(
                  menuMaxHeight: 400,
                  iconEnabledColor: Colors.amber,
                  underline: Container(
                    height: 1,
                    color: const Color.fromARGB(255, 150, 116, 34),
                  ),
                  isExpanded: true,
                  value: selectedItem,
                  items: items
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ))
                      .toList(),
                  onChanged: onChanged,
                ),
              )),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 23, 109, 180))),

                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 170, 132, 17))),
                //labelText: 'valor',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
        ],
      ),
    );
  }
}
