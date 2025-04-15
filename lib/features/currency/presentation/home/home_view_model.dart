import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/available_currency.dart';
import '../../domain/usecase/get_available_currencies_usecase.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final GetAvailableCurrenciesUseCase _getCurrencies;

  HomeViewModel(this._getCurrencies);

  bool isLoading = false;
  List<AvailableCurrency> currencies = [];

  Future<void> fetchCurrencies() async {
    isLoading = true;
    notifyListeners();

    try {
      currencies = await _getCurrencies();
    } catch (e) {
      debugPrint('Error fetching currencies: $e');
      currencies = [];
    }

    isLoading = false;
    notifyListeners();
  }

  AvailableCurrency? selectedBase;
  AvailableCurrency? selectedTarget;

  void selectBaseCurrency(AvailableCurrency? currency) {
    selectedBase = currency;
    // reseta o target se ele for igual ao novo base
    if (selectedTarget?.code == currency?.code) {
      selectedTarget = null;
    }
    notifyListeners();
  }

  void selectTargetCurrency(AvailableCurrency? currency) {
    selectedTarget = currency;
    notifyListeners();
  }

}
