
import 'package:background_test/app/pages/background.dart';
import 'package:background_test/app/pages/second_plane.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(path: "/blockscreenonbackground", builder: (context, state) => const MyBackgroundTest(),),
     GoRoute(path: "/", builder: (context, state) => const MySecondFunction(),),
  ]
);