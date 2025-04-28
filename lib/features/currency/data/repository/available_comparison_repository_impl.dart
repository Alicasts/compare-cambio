import 'package:injectable/injectable.dart';
import '../../domain/repository/available_comparison_repository.dart.dart';
import '../../domain/model/available_comparison.dart';
import '../../domain/mapper/available_comparison_mapper.dart';
import '../services/currency_api_service.dart';
import '../storage/local_available_comparison_storage_service.dart';

@LazySingleton(as: AvailableComparisonRepository)
class AvailableComparisonRepositoryImpl implements AvailableComparisonRepository {
  final CurrencyApiService _apiService;
  final LocalAvailableComparisonStorageService _localStorage;

  AvailableComparisonRepositoryImpl(
      this._apiService,
      this._localStorage,
      );

  @override
  Future<List<AvailableComparison>> getAvailableComparisons() async {
    final cached = _localStorage.getAll();

    if (cached.isNotEmpty) {
      return cached;
    }

    final dtoList = await _apiService.fetchAvailableComparisons();
    final comparisons = dtoList.map((dto) => dto.toDomain()).toList();

    await _localStorage.saveAll(comparisons);

    return comparisons;
  }
}