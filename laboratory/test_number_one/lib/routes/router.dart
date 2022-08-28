import 'package:go_router/go_router.dart';
import 'package:test_number_one/app/pages/icons_config.dart';

final routes = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage(),)
  ]
);
