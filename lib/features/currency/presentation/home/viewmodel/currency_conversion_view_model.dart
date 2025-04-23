import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class CurrencyConversionViewModel extends ChangeNotifier {
  double _baseAmount = 1.0;
  double _conversionRate = 0.0;
  String _baseCurrency = '';
  String _targetCurrency = '';
  bool _isUpdating = false;

  double get baseAmount => _baseAmount;
  double get convertedAmount => _baseAmount * _conversionRate;
  String get baseCurrency => _baseCurrency;
  String get targetCurrency => _targetCurrency;

  void setValues(double rate, String base, String target) {
    _conversionRate = rate;
    _baseCurrency = base;
    _targetCurrency = target;
    _baseAmount = 1.0;
    notifyListeners();
  }

  void updateAmount(double value, {required bool isBase}) {
    if (_isUpdating) return;
    _isUpdating = true;

    if (isBase) {
      _baseAmount = value;
    } else {
      _baseAmount = _conversionRate == 0 ? 0.0 : value / _conversionRate;
    }

    _isUpdating = false;
    notifyListeners();
  }
}
