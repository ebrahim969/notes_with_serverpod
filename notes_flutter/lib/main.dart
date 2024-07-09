import 'package:flutter/material.dart';

void main() {
  runApp(const NotesWithServerpod());
}

class NotesWithServerpod extends StatelessWidget {
  const NotesWithServerpod({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes With Serverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true
      ),
    );
  }
}