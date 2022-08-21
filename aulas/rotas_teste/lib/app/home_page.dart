import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String texto = 'kkkkkkkkkkkk funcionou';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('rota 1'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => GoRouter.of(context).push('/rota/$texto'),
            child: const Text('next route'),
          ),
        ));
  }
}
