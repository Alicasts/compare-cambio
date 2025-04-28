import 'package:injectable/injectable.dart';

import '../model/comparison_data.dart';
import '../repository/comparison_repository.dart';

@injectable
class GetComparisonDataUseCase {
  final ComparisonRepository repository;

  GetComparisonDataUseCase(this.repository);

  Future<List<ComparisonData>> call(String pairCode, [int days = 15]) {
    return repository.getComparisonData(pairCode, days: days);
  }
}
