import 'package:auto_route/auto_route.dart';
import 'package:quicky_notes/core/navigation/app_router.gr.dart';
import 'package:quicky_notes/core/navigation/route_paths.dart';

@RoutePage(name: "LoginRouter")
class LoginRouterPage extends AutoRouter {
  const LoginRouterPage({super.key});
}

final AutoRoute loginRoute = AutoRoute(
  page: LoginRouter.page,
  path: RoutePaths.auth,
  children: <AutoRoute>[
    AutoRoute(page: RegisterRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
  ],
);
