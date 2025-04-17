import '../model/comparison_data.dart';

abstract class ComparisonRepository {
  Future<List<ComparisonData>> fetchComparisonData(String pairCode, int days);
}
