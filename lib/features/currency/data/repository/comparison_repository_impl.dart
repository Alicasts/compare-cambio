import 'package:injectable/injectable.dart';

import '../../domain/model/comparison_data.dart';
import '../../domain/repository/comparison_repository.dart';
import '../mapper/comparison_data_mapper.dart';
import '../services/currency_api_service.dart';
import '../storage/local_comparison_data_storage_service.dart';

@LazySingleton(as: ComparisonRepository)
class ComparisonRepositoryImpl implements ComparisonRepository {
  final CurrencyApiService _api;
  final ComparisonDataMapper _mapper;
  final LocalComparisonDataStorageService _local;

  static const Duration cacheTTL = Duration(hours: 2);

  ComparisonRepositoryImpl(this._api, this._mapper, this._local);

  @override
  Future<List<ComparisonData>> getComparisonData(String pairCode, {int days = 15}) async {
    final cached = await _local.getComparisonData(pairCode);

    if (cached.isNotEmpty) {
      final latest = cached.map((e) => e.date).reduce((a, b) => a.isAfter(b) ? a : b);
      if (DateTime.now().difference(latest) > cacheTTL) {
        return cached;
      }
    }

    final dtos = await _api.fetchComparisonData(pairCode, days: days);
    final list = dtos.map(_mapper.fromDto).toList();
    await _local.saveComparisonData(pairCode, list);
    return list;
  }
}
