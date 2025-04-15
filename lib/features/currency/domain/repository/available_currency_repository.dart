import '../model/available_currency.dart';

abstract class AvailableCurrencyRepository {
  Future<List<AvailableCurrency>> getAvailableCurrencies();
}