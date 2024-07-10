import 'package:flutter/material.dart';
import 'package:notes_flutter/features/note/presentation/widgets/create_new_note_widget.dart';
import 'package:notes_flutter/features/note/presentation/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes with serverpod'),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) {
                return const CreateNewNoteWidget();
              });
      }),
      body: const NotesViewBody(),
    );
  }
}
