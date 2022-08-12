import 'package:flutter/material.dart';
import 'package:hello_world/app/components/app_controler.dart';
import 'package:hello_world/app/components/tela_login.dart';
import 'package:hello_world/app/scraping/scraping_widget.dart';

import 'components/home_page.dart';
import 'components/login_page.dart';
import 'components/scroll_test.dart';

class AppWidget extends StatelessWidget {
  //final String title;
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppControler.instance,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.green,
                brightness: AppControler.instance.isDarkTheme ? Brightness.dark : Brightness.light
                ),
            initialRoute: '/scraping',
            routes: {
              '/': (context) => const MyWidgetHome(),
              '/home': (context) => const HomePage(),
              '/list': (context) => const ScrollWidget(),
              '/login':(context) => const LoginDesafio(),
              '/scraping':(context) => const MyScraping(),
            },
          );
        });
  }
}

//