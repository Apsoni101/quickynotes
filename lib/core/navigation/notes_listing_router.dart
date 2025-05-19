import 'package:auto_route/auto_route.dart';
import 'package:quicky_notes/core/navigation/app_router.gr.dart';
import 'package:quicky_notes/core/navigation/auth_guard.dart';
import 'package:quicky_notes/core/navigation/route_paths.dart';

@RoutePage(name: "NotesRouter")
class NotesRouterPage extends AutoRouter {
  const NotesRouterPage({super.key});
}

AutoRoute notesListingRoute(final AuthGuard authGuard) => AutoRoute(
  page: NotesRouter.page,
  path: RoutePaths.notesListingTab,
  guards: <AutoRouteGuard>[authGuard],
  children: <AutoRoute>[
    AutoRoute(page: NotesListingRoute.page,path: ''),
    AutoRoute(page: NotesAddingRoute.page, path: RoutePaths.notesAdding),
    AutoRoute(page: NotesDetailRoute.page, path: RoutePaths.notesDetail),
    AutoRoute(page: SettingsRoute.page, path: RoutePaths.settings),

  ],
);
