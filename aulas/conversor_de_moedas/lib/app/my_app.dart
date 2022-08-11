import 'package:conversor_de_moedas/app/views/home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MyWidget(),
      },
    );
  }
}
