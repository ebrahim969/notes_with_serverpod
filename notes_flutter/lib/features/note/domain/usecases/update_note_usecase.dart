import 'package:fpdart/fpdart.dart';
import 'package:notes_client/notes_client.dart';
import 'package:notes_flutter/core/error/failures.dart';
import 'package:notes_flutter/core/usecase/usecase.dart';
import 'package:notes_flutter/features/note/domain/repositories/note_repository.dart';

class UpdateNoteUsecase implements UseCase<Note, UpdateNoteParams> {
  final NoteRepository noteRepository;

  UpdateNoteUsecase(this.noteRepository);
  @override
  Future<Either<Failures, Note>> call(UpdateNoteParams params) async {
    return await noteRepository.updateNote(title: params.title, id: params.id);
  }
}

class UpdateNoteParams {
  final String title;
  final int? id;

  UpdateNoteParams({required this.title, required this.id});
}
