import '../model/available_comparison.dart';

abstract class AvailableComparisonRepository {
  Future<List<AvailableComparison>> getAvailableComparisons();
}