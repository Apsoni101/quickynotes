import 'package:auto_route/auto_route.dart';
import 'package:quicky_notes/core/navigation/app_router.gr.dart';

///App router class responsible for entire app navigation
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: NotesAddingRoute.page),
    AutoRoute(page: NotesDetailRoute.page),
    AutoRoute(page: NotesListingRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
  ];
}
