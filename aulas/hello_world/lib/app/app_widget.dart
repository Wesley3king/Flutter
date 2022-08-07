import 'package:flutter/material.dart';
import 'package:hello_world/app/components/app_controler.dart';

import 'components/home_page.dart';
import 'components/login_page.dart';

class AppWidget extends StatelessWidget {
  //final String title;
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.green,
                brightness: Brightness.light
              ),
            home: const HomePage(),
          );
  }
}

// AnimatedBuilder(
//         animation: AppControler.instance,
//         builder: (context, child) {
//           return MaterialApp(
//             theme: ThemeData(
//                 primarySwatch: Colors.green,
//                 brightness: AppControler.instance.isDarkTheme ? Brightness.dark : Brightness.light),
//             home: const HomePage(),
//           );
//         });