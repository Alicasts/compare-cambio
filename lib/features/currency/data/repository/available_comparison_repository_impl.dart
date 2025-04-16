import 'package:injectable/injectable.dart';
import '../../domain/repository/available_comparison_repository.dart.dart';
import '../../domain/model/available_comparison.dart';
import '../../domain/mapper/available_comparison_mapper.dart';
import '../services/currency_api_service.dart';

@LazySingleton(as: AvailableComparisonRepository)
class AvailableComparisonRepositoryImpl implements AvailableComparisonRepository {
  final CurrencyApiService _apiService;

  AvailableComparisonRepositoryImpl(this._apiService);

  @override
  Future<List<AvailableComparison>> getAvailableComparisons() async {
    final dtoList = await _apiService.fetchAvailableComparisons();
    return dtoList.map((dto) => dto.toDomain()).toList();
  }
}