// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:quicky_notes/core/navigation/login_screen_router.dart' as _i2;
import 'package:quicky_notes/core/navigation/notes_listing_router.dart' as _i6;
import 'package:quicky_notes/feature/auth/presentation/pages/login_page.dart'
    as _i1;
import 'package:quicky_notes/feature/auth/presentation/pages/register_page.dart'
    as _i7;
import 'package:quicky_notes/feature/notes/presentation/pages/notes_adding_page.dart'
    as _i3;
import 'package:quicky_notes/feature/notes/presentation/pages/notes_detail_page.dart'
    as _i4;
import 'package:quicky_notes/feature/notes/presentation/pages/notes_listing_page.dart'
    as _i5;
import 'package:quicky_notes/feature/settings/presentation/pages/settings_page.dart'
    as _i8;
import 'package:quicky_notes/feature/splash/presentation/pages/splash_page.dart'
    as _i9;

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i11.Key? key,
    _i11.VoidCallback? onLoggedIn,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, onLoggedIn: onLoggedIn),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i1.LoginPage(key: args.key, onLoggedIn: args.onLoggedIn);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onLoggedIn});

  final _i11.Key? key;

  final _i11.VoidCallback? onLoggedIn;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoggedIn: $onLoggedIn}';
  }
}

/// generated route for
/// [_i2.LoginRouterPage]
class LoginRouter extends _i10.PageRouteInfo<void> {
  const LoginRouter({List<_i10.PageRouteInfo>? children})
    : super(LoginRouter.name, initialChildren: children);

  static const String name = 'LoginRouter';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginRouterPage();
    },
  );
}

/// generated route for
/// [_i3.NotesAddingPage]
class NotesAddingRoute extends _i10.PageRouteInfo<void> {
  const NotesAddingRoute({List<_i10.PageRouteInfo>? children})
    : super(NotesAddingRoute.name, initialChildren: children);

  static const String name = 'NotesAddingRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.NotesAddingPage();
    },
  );
}

/// generated route for
/// [_i4.NotesDetailPage]
class NotesDetailRoute extends _i10.PageRouteInfo<NotesDetailRouteArgs> {
  NotesDetailRoute({
    required String noteId,
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         NotesDetailRoute.name,
         args: NotesDetailRouteArgs(noteId: noteId, key: key),
         initialChildren: children,
       );

  static const String name = 'NotesDetailRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotesDetailRouteArgs>();
      return _i4.NotesDetailPage(noteId: args.noteId, key: args.key);
    },
  );
}

class NotesDetailRouteArgs {
  const NotesDetailRouteArgs({required this.noteId, this.key});

  final String noteId;

  final _i11.Key? key;

  @override
  String toString() {
    return 'NotesDetailRouteArgs{noteId: $noteId, key: $key}';
  }
}

/// generated route for
/// [_i5.NotesListingPage]
class NotesListingRoute extends _i10.PageRouteInfo<void> {
  const NotesListingRoute({List<_i10.PageRouteInfo>? children})
    : super(NotesListingRoute.name, initialChildren: children);

  static const String name = 'NotesListingRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.NotesListingPage();
    },
  );
}

/// generated route for
/// [_i6.NotesRouterPage]
class NotesRouter extends _i10.PageRouteInfo<void> {
  const NotesRouter({List<_i10.PageRouteInfo>? children})
    : super(NotesRouter.name, initialChildren: children);

  static const String name = 'NotesRouter';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.NotesRouterPage();
    },
  );
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i10.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i11.Key? key,
    _i11.VoidCallback? onRegistered,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         RegisterRoute.name,
         args: RegisterRouteArgs(key: key, onRegistered: onRegistered),
         initialChildren: children,
       );

  static const String name = 'RegisterRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>(
        orElse: () => const RegisterRouteArgs(),
      );
      return _i7.RegisterPage(key: args.key, onRegistered: args.onRegistered);
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, this.onRegistered});

  final _i11.Key? key;

  final _i11.VoidCallback? onRegistered;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, onRegistered: $onRegistered}';
  }
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SettingsPage();
    },
  );
}

/// generated route for
/// [_i9.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.SplashPage();
    },
  );
}
