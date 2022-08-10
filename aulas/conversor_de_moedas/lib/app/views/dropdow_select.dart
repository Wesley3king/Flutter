import 'package:flutter/material.dart';

class CustomSelectWidget extends StatefulWidget {
  const CustomSelectWidget({Key? key}) : super(key: key);

  @override
  State<CustomSelectWidget> createState() => _SelectState();
}

class _SelectState extends State<CustomSelectWidget> {
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
              child: DropdownButton<Text>(
              menuMaxHeight: 400,
              //value: Text('k1'),
              iconEnabledColor: Colors.amber,
              underline: Container(
                height: 1,
                color: const Color.fromARGB(255, 150, 116, 34),
              ),
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  child: Text('Real'),
                  value: Text('k1'),
                ),
                DropdownMenuItem(
                  child: Text('Dolar'),
                  value: Text('k2'),
                ),
                DropdownMenuItem(
                  child: Text('Euro'),
                  value: Text('k3'),
                ),
                DropdownMenuItem(
                  child: Text('Bitcoin'),
                  value: Text('k4'),
                ),
              ],
              onChanged: (value) {},
            ),
            )
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: TextField(
              onChanged: (value) {
                print(value);
              },
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 23, 109, 180))),

                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 170, 132, 17))),
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
