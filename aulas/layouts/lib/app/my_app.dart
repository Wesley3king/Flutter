import 'package:flutter/material.dart';
import 'package:layouts/app/routes/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Life',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      initialRoute: '/login',
      routes: {
        '/login':(context) => const LoginPage(),
      },
    );
  }
}
