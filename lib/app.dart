import 'package:flutter/material.dart';
import 'features/currency/presentation/root_page.dart';

class CompareCambioApp extends StatelessWidget {
  const CompareCambioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compare Câmbio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const RootPage(),
    );
  }
}