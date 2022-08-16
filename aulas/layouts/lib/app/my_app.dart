import 'package:flutter/material.dart';
import 'package:layouts/app/routes/bottom_bar.dart';
import 'package:layouts/app/routes/download_files.dart';
import 'package:layouts/app/routes/fab_scroll.dart';
import 'package:layouts/app/routes/hide_bottom_navigation.dart';
import 'package:layouts/app/routes/image_auto.dart';
import 'package:layouts/app/routes/image_cache.dart';
import 'package:layouts/app/routes/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // serve para ver as imagems em modo profile
    //debugInvertOversizedImages = true;

    return MaterialApp(
      title: 'Dog Life',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/bottom': (context) => const MyBottomBar(),
        '/fab': (context) => const MyFabScroll(),
        '/hidebottom': (context) => const MyScrollBottomBar(),
        '/imageauto': (context) => const MyImageAuto(),
        '/imagecache': (context) => const MyImageCache(),
        '/download': (context) => const DownloadFiles(),
      },
    );
  }
}
