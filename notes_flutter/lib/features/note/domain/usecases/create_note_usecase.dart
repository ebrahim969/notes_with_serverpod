import 'package:fpdart/fpdart.dart';
import 'package:notes_flutter/core/error/failures.dart';
import 'package:notes_flutter/core/usecase/usecase.dart';
import 'package:notes_flutter/features/note/domain/repositories/note_repository.dart';

class CreateNoteUsecase implements UseCase<Unit, CreateNoteParams> {
  final NoteRepository noteRepository;

  CreateNoteUsecase(this.noteRepository);
  @override
  Future<Either<Failures, Unit>> call(CreateNoteParams params) async {
    return await noteRepository.createNote(title: params.title);
  }
}

class CreateNoteParams {
  final String title;

  CreateNoteParams({required this.title});
}
