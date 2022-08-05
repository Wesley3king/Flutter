import 'package:flutter/material.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  //final String title;
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}

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
    return Container(
      child: Center(
          child: GestureDetector(
        child: Text('Flutterando $count'),
        onTap: () {
          print('clickado');
          setState(() {
            ++count;
          });
        },
      )),
    );
  }
}
