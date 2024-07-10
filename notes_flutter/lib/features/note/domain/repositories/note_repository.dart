import 'package:fpdart/fpdart.dart';
import 'package:notes_client/notes_client.dart';
import 'package:notes_flutter/core/error/failures.dart';

abstract interface class NoteRepository {
  Future<Either<Failures, Unit>> createNote({required String title,required int id});
  Future<Either<Failures, Unit>> deleteNote({required String title,required int id});
  Future<Either<Failures, Note>> updateNote({required String title,required int id});
  Future<Either<Failures, List<Note>>> getAllNotes();
}
