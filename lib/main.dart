import 'package:flutter/material.dart';
import 'app.dart';
import 'core/di/injection.dart';

void main() {
  configureDependencies();
  runApp(const CompareCambioApp());
}