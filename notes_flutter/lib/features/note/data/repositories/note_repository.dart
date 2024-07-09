import 'package:fpdart/fpdart.dart';
import 'package:notes_client/notes_client.dart';
import 'package:notes_flutter/core/error/failures.dart';

abstract interface class NoteRepository {
  Future<Either<Failures, Unit>> createNote(Note note);
  Future<Either<Failures, Unit>> deleteNote(Note note);
  Future<Either<Failures, Note>> updateNote(Note note);
  Future<Either<Failures, List<Note>>> getAllNotes();
}
