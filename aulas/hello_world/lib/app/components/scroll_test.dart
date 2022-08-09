import 'package:flutter/material.dart';
import 'package:hello_world/app/components/custom_drawer.dart';

class ScrollWidget extends StatelessWidget {
  const ScrollWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('flutter'),
      ),
      body: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
    );
  }
}
/*
CustomScrollView(
        center: key,
        slivers: <Widget>[
          Row(
            children: [
              Container(
                width: 200,
                height: 300,
                color: Colors.lightGreen,
              ),
              Container(
                width: 200,
                height: 300,
                color: Colors.lightGreen,
              ),
              Container(
                width: 200,
                height: 300,
                color: Colors.lightGreen,
              ),
              Container(
                width: 200,
                height: 300,
                color: Colors.lightGreen,
              ),
            ],
          )
        ],
      ),
      */