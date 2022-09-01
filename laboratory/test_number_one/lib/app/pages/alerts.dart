import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAlert extends StatefulWidget {
  const MyAlert({super.key});

  @override
  State<MyAlert> createState() => _MyAlertState();
}

class _MyAlertState extends State<MyAlert> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const SimpleDialog(
                    title: Text('Adicionar:'),
                    children: [
                      ListTile(title: Text('item 1'),),
                      ListTile(title: Text('item 2'),),
                      ListTile(title: Text('item 3'),),

                    ],
                  ),
                );
              },
              icon: const Icon(Icons.notifications_active)),
        ),
      ),
    );
  }
}
