import 'package:compare_cambio/core/constants/constants.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/available_comparison.dart';

@lazySingleton
class LocalAvailableComparisonStorageService {
  static const _boxName = Constants.availableComparisonsBox;

  Future<void> saveAll(List<AvailableComparison> comparisons) async {
    final box = Hive.box<AvailableComparison>(_boxName);
    await box.clear();
    for (var comparison in comparisons) {
      await box.put(comparison.pairCode, comparison);
    }
  }

  List<AvailableComparison> getAll() {
    final box = Hive.box<AvailableComparison>(_boxName);
    return box.values.toList();
  }

  AvailableComparison? getByPairCode(String pairCode) {
    final box = Hive.box<AvailableComparison>(_boxName);
    return box.get(pairCode);
  }

  Future<void> clear() async {
    final box = Hive.box<AvailableComparison>(_boxName);
    await box.clear();
  }
}
