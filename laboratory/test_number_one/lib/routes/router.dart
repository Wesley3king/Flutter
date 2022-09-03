import 'package:go_router/go_router.dart';
import 'package:test_number_one/app/pages/alerts.dart';
import 'package:test_number_one/app/pages/icons_config.dart';

final routes = GoRouter(
  routes: [
    GoRoute(path: '/list', builder: (context, state) => const HomePage(),),
    GoRoute(path: '/', builder: (context, state) => const MyAlert(),)
  ],
);
