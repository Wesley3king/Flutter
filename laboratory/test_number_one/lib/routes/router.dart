import 'package:go_router/go_router.dart';
import 'package:test_number_one/app/pages/alerts.dart';
import 'package:test_number_one/app/pages/bottom_navigation.dart';
import 'package:test_number_one/app/pages/dragable_list.dart';
import 'package:test_number_one/app/pages/icons_config.dart';
import 'package:test_number_one/app/pages/notifications.dart';
import 'package:test_number_one/app/pages/page_view.dart';
import 'package:test_number_one/app/pages/pinch_zoom.dart';
import 'package:test_number_one/app/pages/webview.dart';
import 'package:test_number_one/app/pages/webviewx.dart';
import 'package:test_number_one/app/pages/webviewx_demo.dart';
import 'package:test_number_one/app/pages/zoom.dart';

final routes = GoRouter(
  initialLocation: '/notification',
  routes: [
    GoRoute(path: '/listpages', builder: (context, state) => const HomePage(),),
    GoRoute(path: '/alert', builder: (context, state) => const MyAlert(),),
    GoRoute(path: '/zoom', builder: (context, state) => const MyZoom(),),
    GoRoute(path: '/pinchZoom', builder: (context, state) => const MyPinchZoom(),),
    GoRoute(path: '/', builder: (context, state) => const MyPageView(),),
    GoRoute(path: '/lista', builder: (context, state) => const MyDragebleList(),),
    GoRoute(path: '/web', builder: (context, state) => const WebViewTeste(),),
    GoRoute(path: '/web', builder: (context, state) => const MyWebviewx(),),
    GoRoute(path: '/bottom', builder: (context, state) => const BottomNavigationTeste(),),
    GoRoute(path: '/webviewx', builder: (context, state) => const WebViewXPage(),),
    GoRoute(path: '/notification', builder: (context, state) => const MyNotification(),)
  ],
);