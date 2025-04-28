import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:compare_cambio/features/currency/data/storage/local_available_comparison_storage_service.dart';
import 'package:compare_cambio/features/currency/domain/model/available_comparison.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

void main() {
  group('LocalAvailableComparisonStorageService', () {
    LocalAvailableComparisonStorageService? storage;
    Box<AvailableComparison>? box;

    setUpAll(() async {
      final testDir = Directory(p.join(Directory.current.path, '.dart_tool', 'test_hive'));
      Hive.init(testDir.path);
      Hive.registerAdapter(AvailableComparisonAdapter());
      box = await Hive.openBox<AvailableComparison>('available_comparisons');
      await Hive.openBox<AvailableComparison>('available_comparisons');
      storage = LocalAvailableComparisonStorageService();
    });

    tearDown(() async {
      await box?.clear();
    });

    test('saveAll and getAll should persist and return comparisons', () async {
      final comparisons = [
        AvailableComparison(pairCode: 'USD-BRL', label: 'Dólar/Real'),
        AvailableComparison(pairCode: 'EUR-BRL', label: 'Euro/Real'),
      ];

      await storage!.saveAll(comparisons);
      final result = storage!.getAll();

      expect(result.length, 2);
      expect(result.map((e) => e.pairCode), containsAll(['USD-BRL', 'EUR-BRL']));
    });

    test('getByPairCode should return specific item', () async {
      final comparison = AvailableComparison(pairCode: 'BTC-BRL', label: 'Bitcoin/Real');
      await box!.put(comparison.pairCode, comparison);

      final result = storage!.getByPairCode('BTC-BRL');

      expect(result, isNotNull);
      expect(result?.label, 'Bitcoin/Real');
    });

    test('clear should remove all data', () async {
      await box!.put('USD-BRL', AvailableComparison(pairCode: 'USD-BRL', label: 'Dólar/Real'));

      await storage!.clear();
      final result = storage!.getAll();

      expect(result, isEmpty);
    });
  });
}
