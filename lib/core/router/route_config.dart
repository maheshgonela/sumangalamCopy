import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sumangalam/app/ui/screen.dart';
import 'package:sumangalam/app/ui/splash_scrn.dart';
import 'package:sumangalam/app/widgets/initial_scaffold_with_bottom_nav_bar.dart';
import 'package:sumangalam/core/router/app_route.dart';
import 'package:sumangalam/features/auth/presentation/ui/authentication_scrn.dart';

class AppRouterConfig {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();
  static final _sectionNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: RoutePath.splash.path,
    routes: <RouteBase>[
      GoRoute(
        path: RoutePath.splash.path,
        builder: (_, state) => const AppSplashScrn(),
      ),
      GoRoute(
        path: RoutePath.login.path,
        builder: (_, state) => const AuthenticationScrn(),
      ),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return InitialScaffoldWithBottomNavBar(
                navigationShell: navigationShell);
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
                navigatorKey: _sectionNavigatorKey,
                routes: <RouteBase>[
                  GoRoute(
                    path: RoutePath.home.path,
                    name: RoutePath.home.name,
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                          child: Screen(screenName: 'ahfsj'));
                    },
                  ),
                ]),
          ])
    ],
  );
}
