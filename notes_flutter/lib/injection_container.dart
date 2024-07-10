import 'package:get_it/get_it.dart';
import 'package:notes_client/notes_client.dart';
import 'package:notes_flutter/features/note/data/data_sources/note_remote_datasource.dart';
import 'package:notes_flutter/features/note/data/repositories_impl/note_repository_impl.dart';
import 'package:notes_flutter/features/note/domain/repositories/note_repository.dart';
import 'package:notes_flutter/features/note/domain/usecases/create_note_usecase.dart';
import 'package:notes_flutter/features/note/domain/usecases/delete_note_usecase.dart';
import 'package:notes_flutter/features/note/domain/usecases/gey_all_notes_usecase.dart';
import 'package:notes_flutter/features/note/domain/usecases/update_note_usecase.dart';
import 'package:notes_flutter/features/note/presentation/provider/create_note_provider.dart';
import 'package:notes_flutter/features/note/presentation/provider/get_all_notes_provider.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

final sl = GetIt.instance;

Future<void> initDependenceis() async {
  final client = Client('http://192.168.1.5:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  sl.registerLazySingleton(() => client);
}

initNote() {
  sl
    ..registerFactory<NoteRemoteDataSource>(
        () => NoteRemoteDataSourceImpl(sl()))
    ..registerFactory<NoteRepository>(() => NoteRepositoryImpl(sl()))
    ..registerFactory(() => CreateNoteUsecase(sl()))
    ..registerFactory(() => DeleteNoteUsecase(sl()))
    ..registerFactory(() => UpdateNoteUsecase(sl()))
    ..registerFactory(() => GetAllNotesUseCase(sl()))
    ..registerLazySingleton(() => CreateNoteProvider(sl()))
    ..registerLazySingleton(() => GetAllNotesProvider(sl()));
}
