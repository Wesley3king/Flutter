import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('async dart'),
      ),
      body: ListView.builder(
        itemCount: 16,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('WAITING...'),
          );
        },
      ),
    );
  }
}
