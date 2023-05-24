import 'package:flutter/material.dart';

import 'ui/_ui.dart';
import 'ui_kit/_ui_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunny Stickers',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
