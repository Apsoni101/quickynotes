import 'package:get_it/get_it.dart';
import 'package:quicky_notes/core/constants/app_constants.dart';
import 'package:quicky_notes/core/navigation/auth_guard.dart';
import 'package:quicky_notes/core/services/fcm_service.dart';
import 'package:quicky_notes/core/services/firebase_auth%20_service.dart';
import 'package:quicky_notes/core/services/firebase_firestore_service.dart';
import 'package:quicky_notes/core/services/notification_service.dart';
import 'package:quicky_notes/core/utlis/shared_prefs.dart';
import 'package:quicky_notes/feature/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:quicky_notes/feature/auth/data/repositories/auth_repo_impl.dart';
import 'package:quicky_notes/feature/auth/domain/repositories/auth_repo.dart';
import 'package:quicky_notes/feature/auth/domain/use_cases/auth_usecase.dart';
import 'package:quicky_notes/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:quicky_notes/feature/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:quicky_notes/feature/notes/data/data_sources/notes_remote_data_source.dart';
import 'package:quicky_notes/feature/notes/data/repositories/notes_repository_impl.dart';
import 'package:quicky_notes/feature/notes/domain/repositories/notes_repository.dart';
import 'package:quicky_notes/feature/notes/domain/use_cases/notes_use_case.dart';
import 'package:quicky_notes/feature/notes/presentation/manager/add_note_bloc/add_note_bloc.dart';
import 'package:quicky_notes/feature/notes/presentation/manager/notes_detail_bloc/note_detail_bloc.dart';
import 'package:quicky_notes/feature/notes/presentation/manager/notes_listing_bloc/notes_listing_bloc.dart';
import 'package:quicky_notes/feature/settings/data/data_sources/settings_local_data_source.dart';
import 'package:quicky_notes/feature/settings/data/repositories/settings_repository_impl.dart';
import 'package:quicky_notes/feature/settings/domain/repositories/settings_repository.dart';
import 'package:quicky_notes/feature/settings/domain/use_cases/settings_usecase.dart';
import 'package:quicky_notes/feature/settings/presentation/manager/settings_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

///responsible for injecting
class AppInjector {
  ///responsible for creating getIt instance
  static final GetIt getIt = GetIt.instance;

  ///responsible for setting up ,this will be called on main
  static Future<void> setUp() async {

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final SharedPrefs sharedPrefs = SharedPrefs(sharedPreferences);

    getIt
      //core services
      ..registerLazySingleton(FirebaseAuthService.new)
      ..registerLazySingleton(FirebaseFirestoreService.new)
      ..registerLazySingleton<NotificationService>(
        () => FCMService(projectId: AppsConstants.projectId),
      )
      ..registerLazySingleton(() => sharedPrefs)

    //auth feature
      ..registerLazySingleton<AuthRemoteDataSource>(
        () =>
            AuthRemoteDataSourceImpl(authService: getIt<FirebaseAuthService>()),
      )
      ..registerLazySingleton<AuthRepo>(
        () => AuthRepoImpl(authRemoteDataSource: getIt<AuthRemoteDataSource>()),
      )
      ..registerLazySingleton<AuthUseCase>(
        () => AuthUseCase(authRepo: getIt<AuthRepo>()),
      )
      ..registerFactory<AuthBloc>(
        () => AuthBloc(authUseCase: getIt<AuthUseCase>()),
      )
      ..registerFactory<RegisterBloc>(
        () => RegisterBloc(authUseCase: getIt<AuthUseCase>()),
      )
      //auth guard
      ..registerLazySingleton<AuthGuard>(
        () => AuthGuard(authUseCase: getIt<AuthUseCase>()),
      )
      //notes feature
      ..registerLazySingleton<NotesRemoteDataSource>(
        () => NotesRemoteDataSourceImpl(
          firestoreService: getIt<FirebaseFirestoreService>(),
          notificationService: getIt<NotificationService>(),
        ),
      )
      ..registerLazySingleton<NotesRepository>(
        () => NotesRepositoryImpl(
          remoteDataSource: getIt<NotesRemoteDataSource>(),
        ),
      )
      ..registerLazySingleton<NotesUseCases>(
        () => NotesUseCases(repository: getIt<NotesRepository>()),
      )
      ..registerFactory<NotesListBloc>(
        () => NotesListBloc(useCases: getIt<NotesUseCases>()),
      )
      ..registerFactory<AddNoteBloc>(
        () => AddNoteBloc(useCases: getIt<NotesUseCases>()),
      )
      ..registerFactory<NoteDetailBloc>(
        () => NoteDetailBloc(useCases: getIt<NotesUseCases>()),
      )
      //settings
      ..registerLazySingleton<SettingsLocalDataSource>(
            () => SettingsLocalDataSource(sharedPrefs: getIt<SharedPrefs>()),
      )
      ..registerLazySingleton<SettingsRepository>(
            () => SettingsRepositoryImpl(local: getIt<SettingsLocalDataSource>()),
      )
      ..registerLazySingleton<SettingsUseCase>(
            () => SettingsUseCase(repository: getIt<SettingsRepository>()),
      )
      ..registerFactory<SettingsBloc>(
            () => SettingsBloc(useCase: getIt<SettingsUseCase>()),
      );
  }
}
