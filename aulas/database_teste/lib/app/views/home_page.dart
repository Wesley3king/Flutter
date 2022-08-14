import 'package:database_teste/app/views/hive.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map lista = {};
  @override
  void initState() {
    super.initState();

    database().then((value) {
      setState(() {
        lista = value;
      });
    });
  }

  String _retornar() {
    if (lista['capitulos'] != null) {
      return lista['capitulos'][0]['pages'][2].toString();
    } else {
      return "aguardando...";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('databases'),
      ),
      body: Text('${_retornar()}'),
    );
  }
}
