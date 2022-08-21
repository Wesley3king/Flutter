import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Rota2 extends StatelessWidget {
  final String texto;
  const Rota2({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('rota 2'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(texto),
              const SizedBox(height: 20,),
              ElevatedButton(
              onPressed: () => context.push('/'),
              child: const Text('next route'),
            ),
            ],
          )
        ));
  }
}
