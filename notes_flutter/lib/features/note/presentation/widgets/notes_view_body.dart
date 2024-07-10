import 'package:flutter/material.dart';
import 'package:notes_flutter/features/note/presentation/provider/get_all_notes_provider.dart';
import 'package:provider/provider.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GetAllNotesProvider>(
      builder: (context, getAllNotesProvider, child) {
        if (getAllNotesProvider.state == GetAllNotesStates.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (getAllNotesProvider.state == GetAllNotesStates.failure) {
          return Center(
            child: Text(getAllNotesProvider.errorMessage.toString()),
          );
        } else if (getAllNotesProvider.state == GetAllNotesStates.success) {
          if (getAllNotesProvider.notes.isEmpty) {
            return const Center(
              child: Text('Empty'),
            );
          }
          return ListView.builder(
              itemCount: getAllNotesProvider.notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(getAllNotesProvider.notes[index].text),
                  ),
                );
              });
        }
        return const SizedBox();
      },
    );
  }
}
