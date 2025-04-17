import 'package:compare_cambio/features/currency/domain/mapper/comparison_data_mapper.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/comparison_data.dart';
import '../../domain/repository/comparison_repository.dart';
import '../services/currency_api_service.dart';

@LazySingleton(as: ComparisonRepository)
class ComparisonRepositoryImpl implements ComparisonRepository {
  final CurrencyApiService _apiService;

  ComparisonRepositoryImpl(this._apiService);

  @override
  Future<List<ComparisonData>> fetchComparisonData(String pairCode, int days) async {
    final dtoList = await _apiService.fetchComparisonData(pairCode, days: days);
    return dtoList.map((dto) => dto.toDomain()).toList();
  }
}
