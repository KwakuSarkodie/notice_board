import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notice_board/features/auth/views/registration_page.dart';
import 'package:notice_board/features/home/views/home_page.dart';
import 'package:notice_board/router/router_items.dart';

import '../features/auth/views/login_page.dart';
import '../features/main/views/container_page.dart';

class MyRouter {
  final WidgetRef ref;
  final BuildContext context;
  MyRouter({
    required this.ref,
    required this.context,
  });
  router() => GoRouter(
          initialLocation: RouterItem.homeRoute.path,
          redirect: (context, state) {
            var route = state.fullPath;
            //check if widget is done building
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (route != null && route.isNotEmpty) {
                var item = RouterItem.getRouteByPath(route);
                ref.read(routerProvider.notifier).state = item.name;
              }
            });
            return null;
          },
          routes: [
            ShellRoute(
                builder: (context, state, child) {
                  return ContainerPage(
                    child: child,
                  );
                },
                routes: [
                  GoRoute(path: RouterItem.homeRoute.path, builder: (context, state) {
                    return const HomePage();
                  }),
                  GoRoute(path: RouterItem.loginRoute.path, builder: (context, state) {
                    return const LoginPage();
                  }),
                  GoRoute(path: RouterItem.registerRoute.path, builder: (context, state) {
                    return const RegistrationPage();
                  }),
                  
                ])
          ]);

  void navigateToRoute(RouterItem item) {
    ref.read(routerProvider.notifier).state = item.name;
    context.go(item.path);
  }

  void navigateToNamed(
      {required Map<String, String> pathPrams,
      required RouterItem item,
      Map<String, dynamic>? extra}) {
    ref.read(routerProvider.notifier).state = item.name;
    context.goNamed(item.name, pathParameters: pathPrams, extra: extra);
  }
}

final routerProvider = StateProvider<String>((ref) {
  return RouterItem.homeRoute.name;
});