import 'package:compare_cambio/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'app.dart';
import 'core/di/injection.dart';
import 'features/currency/domain/model/available_comparison.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(AvailableComparisonAdapter());

  await Hive.openBox<AvailableComparison>(Constants.availableComparisonsBox);

  configureDependencies();
  runApp(const CompareCambioApp());
}