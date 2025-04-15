import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../dto/available_currency_dto.dart';

@lazySingleton
class CurrencyApiService {
  final Dio _dio;

  CurrencyApiService(this._dio);

  Future<List<AvailableCurrencyDto>> fetchCurrencyList() async {
    final response = await _dio.get('/currencies/available');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data
          .map((json) => AvailableCurrencyDto.fromJson(json))
          .toList();
    } else {
      throw Exception(
          'Error ${response.statusCode ?? '???'}: ${response.statusMessage ?? 'unknown message'}');
    }
  }
}
