import 'package:compare_cambio/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../dto/available_comparison_dto.dart';

@lazySingleton
class CurrencyApiService {
  final Dio _dio;

  CurrencyApiService(this._dio);

  Future<List<AvailableComparisonDto>> fetchAvailableComparisons() async {
    final response = await _dio.get(Constants.availablePairsPath);

    if (response.statusCode == 200) {
      final data = Map<String, dynamic>.from(response.data);

      return data.entries
          .map((entry) => AvailableComparisonDto(
        pairCode: entry.key,
        label: entry.value,
      ))
          .toList();
    } else {
      throw Exception(
          'Error ${response.statusCode ?? '???'}: ${response.statusMessage ?? 'unknown message'}');
    }
  }
}
