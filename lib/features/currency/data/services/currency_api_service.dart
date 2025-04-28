import 'package:compare_cambio/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../dto/available_comparison_dto.dart';
import '../dto/comparison_data_dto.dart';

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

  Future<List<ComparisonDataDto>> fetchComparisonData(String pairCode, {int days = 15}) async {
    final response = await _dio.get('${Constants.dailyComparisonBasePath}$pairCode/$days');

    if (response.statusCode == 200) {
      final data = List<Map<String, dynamic>>.from(response.data);
      return data.map((e) => ComparisonDataDto.fromJson(e)).toList();
    } else {
      throw Exception('Erro ${response.statusCode}: ${response.statusMessage}');
    }
  }
}
