import 'package:notes_client/notes_client.dart';
import 'package:notes_flutter/core/error/failures.dart';

abstract interface class NoteRemoteDataSource {
  Future<void> createNote({required Note note});
  Future<void> deleteNote({required Note note});
  Future<Note> updateNote({required Note note});
  Future<List<Note>> getAllNotes();
}

class NoteRemoteDataSourceImpl implements NoteRemoteDataSource {
  final Client client;

  NoteRemoteDataSourceImpl(this.client);
  @override
  Future<void> createNote({required Note note}) async {
    try {
      await client.notes.createNote(note);
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> deleteNote({required Note note}) async {
    try {
      await client.notes.deleteNote(note);
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<Note>> getAllNotes() async {
    try {
      return await client.notes.getAllNotes();
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<Note> updateNote({required Note note}) async{
    try {
      return await client.notes.updateNote(note);
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
