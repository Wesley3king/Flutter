import 'package:go_router/go_router.dart';
import 'package:test_number_one/app/pages/alerts.dart';
import 'package:test_number_one/app/pages/dragable_list.dart';
import 'package:test_number_one/app/pages/icons_config.dart';
import 'package:test_number_one/app/pages/page_view.dart';
import 'package:test_number_one/app/pages/pinch_zoom.dart';
import 'package:test_number_one/app/pages/zoom.dart';

final routes = GoRouter(
  routes: [
    GoRoute(path: '/list', builder: (context, state) => const HomePage(),),
    GoRoute(path: '/alert', builder: (context, state) => const MyAlert(),),
    GoRoute(path: '/zoom', builder: (context, state) => const MyZoom(),),
    GoRoute(path: '/pinchZoom', builder: (context, state) => const MyPinchZoom(),),
    GoRoute(path: '/page', builder: (context, state) => const MyPageView(),),
    GoRoute(path: '/', builder: (context, state) => const MyDragebleList(),),
  ],
);
