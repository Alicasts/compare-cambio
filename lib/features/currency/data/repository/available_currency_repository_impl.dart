import 'package:injectable/injectable.dart';
import '../../domain/repository/available_currency_repository.dart';
import '../../domain/model/available_currency.dart';
import '../../domain/mapper/available_currency_mapper.dart';
import '../services/currency_api_service.dart';

@LazySingleton(as: AvailableCurrencyRepository)
class AvailableCurrencyRepositoryImpl implements AvailableCurrencyRepository {
  final CurrencyApiService _apiService;

  AvailableCurrencyRepositoryImpl(this._apiService);

  @override
  Future<List<AvailableCurrency>> getAvailableCurrencies() async {
    final dtoList = await _apiService.fetchCurrencyList();
    return dtoList.map((dto) => dto.toDomain()).toList();
  }
}