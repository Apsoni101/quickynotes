// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:quicky_notes/feature/auth/presentation/pages/login_page.dart'
    as _i1;
import 'package:quicky_notes/feature/auth/presentation/pages/register_page.dart'
    as _i5;
import 'package:quicky_notes/feature/notes/presentation/pages/notes_adding_page.dart'
    as _i2;
import 'package:quicky_notes/feature/notes/presentation/pages/notes_detail_page.dart'
    as _i3;
import 'package:quicky_notes/feature/notes/presentation/pages/notes_listing_page.dart'
    as _i4;
import 'package:quicky_notes/feature/splash/presentation/pages/splash_page.dart'
    as _i6;

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginPage();
    },
  );
}

/// generated route for
/// [_i2.NotesAddingPage]
class NotesAddingRoute extends _i7.PageRouteInfo<void> {
  const NotesAddingRoute({List<_i7.PageRouteInfo>? children})
    : super(NotesAddingRoute.name, initialChildren: children);

  static const String name = 'NotesAddingRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.NotesAddingPage();
    },
  );
}

/// generated route for
/// [_i3.NotesDetailPage]
class NotesDetailRoute extends _i7.PageRouteInfo<void> {
  const NotesDetailRoute({List<_i7.PageRouteInfo>? children})
    : super(NotesDetailRoute.name, initialChildren: children);

  static const String name = 'NotesDetailRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.NotesDetailPage();
    },
  );
}

/// generated route for
/// [_i4.NotesListingPage]
class NotesListingRoute extends _i7.PageRouteInfo<void> {
  const NotesListingRoute({List<_i7.PageRouteInfo>? children})
    : super(NotesListingRoute.name, initialChildren: children);

  static const String name = 'NotesListingRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.NotesListingPage();
    },
  );
}

/// generated route for
/// [_i5.RegisterPage]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute({List<_i7.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.RegisterPage();
    },
  );
}

/// generated route for
/// [_i6.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplashPage();
    },
  );
}
