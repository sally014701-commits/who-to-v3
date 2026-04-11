import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'features/session/presentation/pages/entry_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Who2MeetApp(),
    ),
  );
}

class Who2MeetApp extends StatelessWidget {
  const Who2MeetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Who2Meet',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const EntryPage(),
    );
  }
}
