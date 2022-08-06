import 'package:flutter/material.dart';
import 'package:hello_world/app/components/theme_switcher.dart';

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
        actions: const [
          CustonSwitcher(),
          ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
          //width: double.infinity,
          height: 110,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 100.0,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color:const Color.fromARGB(255, 7, 87, 48),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.greenAccent,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Color.fromARGB(255, 9, 67, 153),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Color.fromARGB(139, 105, 240, 175),
                ),
              ],
            )
          ),
        Container(
          //width: double.infinity,
          height: 110,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 100.0,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color:const Color.fromARGB(255, 7, 87, 48),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.greenAccent,
                ),
              ],
          ),
        ),
        Container(
          //width: double.infinity,
          height: 110,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 100.0,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color:const Color.fromARGB(255, 7, 87, 48),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.greenAccent,
                ),
              ],
            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            ++count;
          });
        },
      ),
    );
  }
}