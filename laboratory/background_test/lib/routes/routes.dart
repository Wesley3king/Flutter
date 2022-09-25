
import 'package:background_test/app/pages/background.dart';
import 'package:background_test/app/pages/bottom_and_app_bar.dart';
import 'package:background_test/app/pages/extensions.dart';
import 'package:background_test/app/pages/manage_archives.dart';
import 'package:background_test/app/pages/reload.dart';
import 'package:background_test/app/pages/request_permission.dart';
import 'package:background_test/app/pages/second_plane.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(path: "/blockscreenonbackground", builder: (context, state) => const MyBackgroundTest(),),
    GoRoute(path: "/second", builder: (context, state) => const MySecondFunction(),),
    GoRoute(path: "/refresh", builder: (context, state) => const ReloadSpinner(),),
    GoRoute(path: "/permission", builder: (context, state) => const PermissionHandler(),),
    GoRoute(path: "/btapp", builder: (context, state) => const BottomNavigationAndAppBar(),),
    GoRoute(path: "/files", builder: (context, state) => const ManageArchives(),),
    GoRoute(path: "/", builder: (context, state) => const ExtensionDart(),),
  ]
);