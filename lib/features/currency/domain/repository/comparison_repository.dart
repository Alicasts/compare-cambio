import '../model/comparison_data.dart';

abstract class ComparisonRepository {
  Future<List<ComparisonData>> getComparisonData(String pairCode, {int days});
}
