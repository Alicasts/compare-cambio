import 'package:injectable/injectable.dart';
import '../model/available_currency.dart';
import '../repository/available_currency_repository.dart';

@injectable
class GetAvailableCurrenciesUseCase {
  final AvailableCurrencyRepository _repository;

  GetAvailableCurrenciesUseCase(this._repository);

  Future<List<AvailableCurrency>> call() {
    return _repository.getAvailableCurrencies();
  }
}
