import 'package:flutter/material.dart';
import 'package:notes_client/notes_client.dart';
import 'package:notes_flutter/core/usecase/usecase.dart';
import 'package:notes_flutter/features/note/domain/usecases/gey_all_notes_usecase.dart';

enum GetAllNotesStates { initial, loading, success, failure }

class GetAllNotesProvider extends ChangeNotifier {
  final GetAllNotesUseCase getAllNotesUseCase;

  GetAllNotesProvider(this.getAllNotesUseCase);

  GetAllNotesStates _state = GetAllNotesStates.initial;
  GetAllNotesStates get state => _state;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<Note> _notes = [];
  List<Note> get notes => _notes;

  void getAllNotesEvent() async {
    _state = GetAllNotesStates.loading;
    notifyListeners();
    final notes = await getAllNotesUseCase(NoParams());
    notes.fold((failure) {
      _state = GetAllNotesStates.failure;
      _errorMessage = failure.message;
    }, (allNotes) {
      _state = GetAllNotesStates.success;
      _errorMessage = null;
      _notes = allNotes;
    });
    notifyListeners();
  }
}
