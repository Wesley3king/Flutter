import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: const Text('king@mail.com'),
            accountName: const Text('King of Shadows'),
            currentAccountPicture: ClipOval(
              child: Image.network(
                'https://images.unsplash.com/photo-1587133966114-7f69b8803e1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            textColor: Colors.green,
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            subtitle: const Text('initial page'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          ListTile(
            textColor: Colors.green,
            leading: const Icon(Icons.arrow_back),
            title: const Text('Logout'),
            subtitle: const Text('go out'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_right),
            title: const Text('Lista de teste'),
            subtitle: const Text('go to next page'),
            onTap: () {
              Navigator.of(context).pushNamed('/list');
            },
          ),
          ListTile(
            leading: const Icon(Icons.key),
            title: const Text('Desafio'),
            subtitle: const Text('tela de login'),
            onTap: () {
              Navigator.of(context).pushNamed('/login');
            },
          )
        ],
      ),
    );
  }
}
