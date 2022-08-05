import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<StatefulWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        height: 200,
        width: 200,
        color: Colors.teal,
        child: Align(
            alignment: Alignment.center,
            child: Container(
            width: 100,
            height: 100,
            color: Colors.amber,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print('clickado');
          setState(() {
            ++count;
          });
        },
      ),
    );
  }
}
