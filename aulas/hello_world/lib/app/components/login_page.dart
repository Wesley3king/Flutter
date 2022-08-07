import 'package:flutter/material.dart';

class MyWidgetHome extends StatefulWidget {
  const MyWidgetHome({Key? key}) : super(key: key);

  @override
  State<MyWidgetHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidgetHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  // aqui recebemos o valor do input
                  onChanged: (value) {
                    print(value);
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                ),
                const SizedBox(height: 10),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'texto'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      print('ok this is ok');
                    },
                    child: const Text('login')),
              ],
            ),
          )),
        ),
    );
  }
}
