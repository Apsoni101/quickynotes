import 'package:auto_route/auto_route.dart';
import 'package:quicky_notes/core/di/app_injector.dart';
import 'package:quicky_notes/core/navigation/app_router.gr.dart';
import 'package:quicky_notes/core/navigation/auth_guard.dart';
import 'package:quicky_notes/core/navigation/login_screen_router.dart';
import 'package:quicky_notes/core/navigation/notes_listing_router.dart';
import 'package:quicky_notes/core/navigation/route_paths.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard = AppInjector.getIt<AuthGuard>();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: SplashRoute.page, path: RoutePaths.splash, initial: true),
    notesListingRoute(authGuard),
    loginRoute,
  ];
}
