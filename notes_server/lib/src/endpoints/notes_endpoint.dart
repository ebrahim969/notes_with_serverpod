import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class NotesEndpoint extends Endpoint {
  Future<void> createNote(Session session, Note note) async {
    try {
      await Note.db.insertRow(session, note);
    } on DatabaseInsertRowException catch (e) {
      session.log(e.toString());
      throw CustomException(message: e.message);
    } catch (e) {
      session.log(e.toString());
      throw CustomException(message: e.toString());
    }
  }

  Future<void> deleteNote(Session session, Note note) async {
    try {
      await Note.db.deleteRow(session, note);
    } on DatabaseDeleteRowException catch (e) {
      session.log(e.toString());
      throw CustomException(message: e.message);
    } catch (e) {
      session.log(e.toString());
      throw CustomException(message: e.toString());
    }
  }

  Future<List<Note>> getAllNotes(Session session) async {
    try {
      return await Note.db.find(
        session,
        orderBy: (t) => t.id,
      );
    } on DatabaseException catch (e) {
      session.log(e.toString());
      throw CustomException(message: e.message);
    } catch (e) {
      session.log(e.toString());
      throw CustomException(message: e.toString());
    }
  }

  Future<Note> updateNote(Session session, Note note) async {
    try {
      final updatedNote = await Note.db.updateRow(
        session,
        note,
      );
      return updatedNote;
    } on DatabaseUpdateRowException catch (e) {
      session.log(e.toString());
      throw CustomException(message: e.message);
    } catch (e) {
      session.log(e.toString());
      throw CustomException(message: e.toString());
    }
  }
}
