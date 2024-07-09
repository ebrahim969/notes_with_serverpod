import 'package:notes_server/src/exception/custom_exception.dart';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class NotesEndpoint extends Endpoint {
  Future<void> createNote(Session session, Note note) async {
    try {
      await Note.db.insertRow(session, note);
    } on DatabaseDeleteRowException catch (e) {
      session.log(e.toString());
      throw CustomException(e.message);
    } catch (e) {
      session.log(e.toString());
      throw CustomException(e.toString());
    }
  }

  Future<void> deleteNote(Session session, Note note) async {
    try {
      await Note.db.deleteRow(session, note);
    } on DatabaseDeleteRowException catch (e) {
      session.log(e.toString());
      throw CustomException(e.message);
    } catch (e) {
      session.log(e.toString());
      throw CustomException(e.toString());
    }
  }

  Future<List<Note>> getAllNotes(Session session) async {
    try {
      return await Note.db.find(
        session,
        orderBy: (t) => t.id,
      );
    } on DatabaseDeleteRowException catch (e) {
      session.log(e.toString());
      throw CustomException(e.message);
    } catch (e) {
      session.log(e.toString());
      throw CustomException(e.toString());
    }
  }

  Future<Note> updateNote(Session session, Note note) async {
    try {
      final updatedNote = await Note.db.updateRow(
        session,
        note,
      );
      return updatedNote;
    } on DatabaseDeleteRowException catch (e) {
      session.log(e.toString());
      throw CustomException(e.message);
    } catch (e) {
      session.log(e.toString());
      throw CustomException(e.toString());
    }
  }
}
