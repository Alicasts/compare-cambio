import '../../data/dto/available_currency_dto.dart';
import '../model/available_currency.dart';

extension AvailableCurrencyDtoMapper on AvailableCurrencyDto {
  AvailableCurrency toDomain() {
    return AvailableCurrency(
      code: code,
      label: label,
    );
  }
}