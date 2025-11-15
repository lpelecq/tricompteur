import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/screens/counters.dart';
void main() {
  runApp(
    const ProviderScope(
      // <-- MUST be here
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counters App',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: CountersScreen(),
    );
  }
}
