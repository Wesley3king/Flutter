import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rotas_teste/app/controllers/auth_route.dart';
import 'package:rotas_teste/app/home_page.dart';
import 'package:rotas_teste/app/login_page.dart';
import 'package:rotas_teste/app/rota2.dart';

final authservice = AuthService();

final routes = GoRouter(
    //initialLocation: '/rota',
    // é um listener para executar redirecionamentos
    refreshListenable: authservice,
    // quando o listener for acionado, é este parametro que
    // será executado
    redirect: (state) {
      final bool isAuth = AuthService.isAuth;
      final isLoginRoute = state.subloc == '/login';

      if (!isAuth) {
        // se o usuario já estiver na pagina de login ele
        // não será redirecionado.
        return isLoginRoute ? null : '/login';
      }

      if (isLoginRoute) return '/';

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
          path: '/rota/:text',
          //builder: (context, state) => const Rota2(),
          pageBuilder: (context, state) {
            String parametro = state.params['text'].toString();
            return MaterialPage(
              fullscreenDialog: true,
              child: Rota2(
                texto: parametro,
              ),
            );
          }),
      GoRoute(path: '/login', builder: ((context, state) => const LoginPage())),
    ]);
