import 'package:flutter/material.dart';
import 'package:notes_flutter/features/note/presentation/widgets/create_note_form.dart';

class CreateNewNoteWidget extends StatelessWidget {
  const CreateNewNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom == 0
              ? 16
              : MediaQuery.of(context).viewInsets.bottom),
      child:  const AbsorbPointer(
            absorbing: false,
            child: SingleChildScrollView(child: CreateNoteForm()),
          )
    );
        }
}

