import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExtensionDart extends StatefulWidget {
  const ExtensionDart({super.key});

  @override
  State<ExtensionDart> createState() => _ExtensionDartState();
}

class _ExtensionDartState extends State<ExtensionDart> {
  List<Map<String, dynamic>> lista = [
    {
      "nome": "king",
      "print": () async {
        print("king");
      }
    },
    {
      "nome": "king",
      "print": () async {
        print(" of ");
      }
    },
    {
      "nome": "king",
      "print": () async {
        print("shadows");
      }
    }
  ];
  var data;

  void readFile() async {
    var url = Uri.https('wesley3king.github.io', 'reactJS/tst.dart');
    var datar = await http.get(url);

    //var data = await http.read(Uri.https('example.com', 'foobar.txt'));
    print(datar.body);
    data = datar.body;
    data.toFunctigreon();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                lista[0]['print']();
                lista[1]['print']();
                lista[2]['print']();
              },
              child: const Text("read extension")),
          TextButton(
              onPressed: () {}, child: const Text("read extension")),
        ],
      ),
    );
  }
}
