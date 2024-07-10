import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/core/theme/theme.dart';
import 'package:notes_flutter/features/note/presentation/provider/create_note_provider.dart';
import 'package:notes_flutter/features/note/presentation/provider/get_all_notes_provider.dart';
import 'package:notes_flutter/features/note/presentation/views/notes_view.dart';
import 'package:notes_flutter/injection_container.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependenceis();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> sl<CreateNoteProvider>()),
      ChangeNotifierProvider(create: (_)=> sl<GetAllNotesProvider>()),
    ],

    child: const NotesWithServerpod()));
}

class NotesWithServerpod extends StatelessWidget {
  const NotesWithServerpod({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexify(
      designWidth: 375,
      designHeight: 812,
      app: MaterialApp(
        title: 'Notes With Serverpod',
        theme: AppTheme.darkThemeMode,
        home: const NotesView(),
      ),
    );
  }
}
