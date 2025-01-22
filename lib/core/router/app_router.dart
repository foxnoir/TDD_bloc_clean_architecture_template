import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tdd_clean_architecture/core/router/app_router_names.dart';
import 'package:tdd_clean_architecture/core/router/page_not_found.dart';
import 'package:tdd_clean_architecture/core/router/transiton_page.dart';
import 'package:tdd_clean_architecture/features/auth/presentation/views/auth_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter({required this.isTesting});
  final bool isTesting;

  GoRouter router([String? initialLocation]) => GoRouter(
        initialLocation: AppRouteNames.auth,
        navigatorKey: navigatorKey,
        errorBuilder: (context, state) => const PageNotFound(),
        routes: [
          ShellRoute(
            builder: (context, state, child) => Scaffold(
              body: child,
            ),
            routes: [
              GoRoute(
                path: AppRouteNames.auth,
                name: AppRouteNames.auth,
                builder: (context, state) => AuthScreen(isTesting: isTesting),
              ),
            ],
          ),
        ],
      );
}

final appRouter = AppRouter(isTesting: false).router();

extension GoRouterLocation on GoRouter {
  String location({required bool isTesting}) {
    final lastMatch = isTesting
        ? RouteMatch(
            route: GoRoute(
              path: AppRouteNames.auth,
              name: AppRouteNames.auth,
              pageBuilder: (context, state) => SlideTransitionPage(
                key: state.pageKey,
                child: AuthScreen(isTesting: isTesting),
              ),
            ),
            pageKey: const ValueKey('routeTesting'),
            matchedLocation: '',
          )
        : routerDelegate.currentConfiguration.last;
    final matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
