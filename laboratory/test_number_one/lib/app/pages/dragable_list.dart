import 'package:flutter/material.dart';

class MyDragebleList extends StatefulWidget {
  const MyDragebleList({super.key});

  @override
  State<MyDragebleList> createState() => _MyDragebleListState();
}

class _MyDragebleListState extends State<MyDragebleList> {
  final List lista = [
    "dart",
    "flutter",
    "node js",
    "react",
    "mySQL",
    "MongoDB",
    "javascript"
  ];
  List<String> _list = ["Apple", "Ball", "Cat", "Dog", "Elephant"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("dragable list"),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => ExpansionTile(
            key: UniqueKey(),
            title: Text("item"),
            children: const [
              ListTile(title: Text('option'),),
              ListTile(title: Text('option'),),

            ],
          ),)
    );
  }
}
