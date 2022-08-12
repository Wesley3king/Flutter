import 'package:flutter/material.dart';
import 'package:hello_world/app/components/custom_drawer.dart';
import 'package:hello_world/app/scraping/controller_scraping.dart';

class MyScraping extends StatelessWidget {
  const MyScraping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text('scraping'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: const ScrapingState(),
          ),
        ));
  }
}

class ScrapingState extends StatefulWidget {
  const ScrapingState({Key? key}) : super(key: key);

  @override
  State<ScrapingState> createState() => _ScrapingStateState();
}

class _ScrapingStateState extends State<ScrapingState> {
  String texto = "iniciando...";
  var scraping = DoScraping();

  Future<void> atualizar() async {
    String res = await scraping.scraping();
    setState(() {
      texto = res;
    });
  }

  @override
  void initState() {
    atualizar();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(texto),
    );
  }
}
