import 'package:flutter/material.dart';
import 'package:rotas_teste/app/controllers/auth_route.dart';
import 'package:rotas_teste/app/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService service = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextFormField(
                onChanged: (String text) {},
              ),
              ElevatedButton(onPressed: ()=> authservice.login(), child: const Text('login')),
            ],
          ),
        ),
      ),
    );
  }
}
