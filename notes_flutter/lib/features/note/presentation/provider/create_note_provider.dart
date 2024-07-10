import 'package:flutter/material.dart';
import 'package:notes_flutter/features/note/domain/usecases/create_note_usecase.dart';

enum CreateNoteStates { initial, loading, success, failure }

class CreateNoteProvider extends ChangeNotifier {
  final CreateNoteUsecase createNoteUsecase;

  CreateNoteProvider(this.createNoteUsecase);

  int _lastid = 0;
  int get nextId => ++_lastid;

  CreateNoteStates _states = CreateNoteStates.initial;
  CreateNoteStates get state => _states;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void createNoteEvent({required String title}) async {
    _states = CreateNoteStates.loading;
    notifyListeners();
    int newId = nextId;
    final createNote =
        await createNoteUsecase(CreateNoteParams(title: title, id: newId));
    createNote.fold((failure) {
      _states = CreateNoteStates.failure;
      _errorMessage = failure.message;
    }, (unit) {
      _states = CreateNoteStates.success;
      _errorMessage = null;
    });
    notifyListeners();

  }

  void resetState() {
    _states = CreateNoteStates.initial;
    notifyListeners();
  }
}
