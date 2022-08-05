import 'package:flutter/material.dart';

import 'components/home_page.dart';

class AppWidget extends StatelessWidget {
  //final String title;
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}