import 'package:flutter/material.dart';
import 'package:notes_flutter/core/router/app_router.dart';
import 'package:notes_flutter/core/theme/theme.dart';

void main() {
  runApp(const NotesWithServerpod());
}

class NotesWithServerpod extends StatelessWidget {
  const NotesWithServerpod({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Notes With Serverpod',
      theme: AppTheme.darkThemeMode,
      routerConfig: routes,
    );
  }
}