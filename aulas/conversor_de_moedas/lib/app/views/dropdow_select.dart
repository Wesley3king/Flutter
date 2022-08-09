
import 'package:flutter/material.dart';

class CustomSelectWidget extends StatefulWidget {
  const CustomSelectWidget({Key? key}) : super(key: key);

  @override
  State<CustomSelectWidget> createState() => _SelectState();
}

class _SelectState extends State<CustomSelectWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: DropdownButton<Text>(
            // hint: Text('dfgbvdf'),
            // value: null,
            items: const [
               //DropdownMenuItem(child: Text('Real')),
               //DropdownMenuItem(child: Text('Dolar')),
               //DropdownMenuItem(child: Text('Euro')),
               DropdownMenuItem(child: Text('Bitcoin')),
            ],
            onChanged: (value) {},
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          flex: 2,
          child: TextField(
            onChanged: (value) {
              print(value);
            },
            decoration: const InputDecoration(),
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }
}
