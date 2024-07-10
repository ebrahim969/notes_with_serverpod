import 'package:fpdart/fpdart.dart';
import 'package:notes_client/notes_client.dart';
import 'package:notes_flutter/core/error/failures.dart';
import 'package:notes_flutter/core/usecase/usecase.dart';
import 'package:notes_flutter/features/note/domain/repositories/note_repository.dart';

class GetAllNotesUseCase implements UseCase<List<Note>, NoParams> {
  final NoteRepository noteRepository;

  GetAllNotesUseCase(this.noteRepository);
  @override
  Future<Either<Failures, List<Note>>> call(NoParams params) async {
    return await noteRepository.getAllNotes();
  }
}
