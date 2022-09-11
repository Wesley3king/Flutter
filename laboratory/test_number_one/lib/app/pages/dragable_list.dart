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
      body: ReorderableListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(lista[index]),
          key: UniqueKey(),
          leading: const Icon(Icons.density_large),
        ),
        itemCount: lista.length,
        onReorder: (oldIndex, newIndex) {
          print('old: $oldIndex new: $newIndex');
          if (oldIndex != newIndex) {
            String item = lista[oldIndex];
            if (oldIndex > newIndex) {
              // bottom to top
              for (int i = oldIndex; i > newIndex; i--) {
                
                lista[i] = lista[i - 1];
              }
              lista[newIndex] = item;
            } else if (oldIndex < newIndex) {
              // top to bottom
              int noMove = newIndex - 1;
              int index = 0;
              int local = oldIndex;
              do {
                lista[local] = lista[++local];
                index++;
                print(index);
              } while (index < noMove - oldIndex);
               lista[noMove] = item;
            }
            setState(() {});
          }
        },
      ),
    );
  }
}
