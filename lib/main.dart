import 'package:flutter/material.dart';

void main() {
  runApp(const CompareCambioApp());
}

class CompareCambioApp extends StatelessWidget {
  const CompareCambioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compare Câmbio',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text('Compare Câmbio')),
      ),
    );
  }
}