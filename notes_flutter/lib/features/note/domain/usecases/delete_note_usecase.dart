import 'package:fpdart/fpdart.dart';
import 'package:notes_flutter/core/error/failures.dart';
import 'package:notes_flutter/core/usecase/usecase.dart';
import 'package:notes_flutter/features/note/domain/repositories/note_repository.dart';

class DeleteNoteUsecase implements UseCase<Unit, DeleteNoteParams> {
  final NoteRepository noteRepository;

  DeleteNoteUsecase(this.noteRepository);
  @override
  Future<Either<Failures, Unit>> call(DeleteNoteParams params) async {
    return await noteRepository.deleteNote(title: params.title, id: params.id);
  }
}

class DeleteNoteParams {
  final String title;
  final int id;

  DeleteNoteParams({required this.title, required this.id});
}
