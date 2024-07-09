import 'package:fpdart/fpdart.dart';
import 'package:notes_client/notes_client.dart';
import 'package:notes_flutter/core/error/failures.dart';
import 'package:notes_flutter/features/note/data/data_sources/note_remote_datasource.dart';
import 'package:notes_flutter/features/note/data/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDataSource noteRemoteDataSource;

  NoteRepositoryImpl(this.noteRemoteDataSource);
  @override
  Future<Either<Failures, Unit>> createNote(Note note) async {
    try {
      await noteRemoteDataSource.createNote(note: note);
      return right(unit);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, Unit>> deleteNote(Note note) async {
    try {
      await noteRemoteDataSource.deleteNote(note: note);
      return right(unit);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, List<Note>>> getAllNotes() async {
    try {
      final notes = await noteRemoteDataSource.getAllNotes();
      return right(notes);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, Note>> updateNote(Note note) async {
    try {
      final noteUpdated = await noteRemoteDataSource.updateNote(note: note);
      return right(noteUpdated);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }
}
