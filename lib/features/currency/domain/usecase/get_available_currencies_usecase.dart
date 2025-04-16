import 'package:injectable/injectable.dart';
import '../model/available_comparison.dart';
import '../repository/available_comparison_repository.dart.dart';

@injectable
class GetAvailableComparisonsUseCase {
  final AvailableComparisonRepository _repository;

  GetAvailableComparisonsUseCase(this._repository);

  Future<List<AvailableComparison>> call() {
    return _repository.getAvailableComparisons();
  }
}
