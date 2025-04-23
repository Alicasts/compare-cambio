import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/available_comparison.dart';
import '../../../domain/model/comparison_data.dart';
import '../../../domain/usecase/get_available_currencies_usecase.dart';
import '../../../domain/usecase/get_comparison_data_usecase.dart';
import 'currency_conversion_view_model.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final GetAvailableComparisonsUseCase _getComparisons;
  final GetComparisonDataUseCase _getComparisonDataUseCase;
  final CurrencyConversionViewModel _conversionViewModel;

  HomeViewModel(
      this._getComparisons,
      this._getComparisonDataUseCase,
      this._conversionViewModel,
      );

  bool isLoading = false;
  List<AvailableComparison> comparisons = [];
  AvailableComparison? selectedComparison;
  List<ComparisonData> comparisonHistory = [];

  CurrencyConversionViewModel get currencyConversionViewModel => _conversionViewModel;

  Future<void> fetchComparisons() async {
    isLoading = true;
    notifyListeners();

    try {
      comparisons = await _getComparisons();
    } catch (e) {
      comparisons = [];
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> selectComparison(AvailableComparison? comparison) async {
    selectedComparison = comparison;
    notifyListeners();

    isLoading = true;
    notifyListeners();

    if (comparison != null) {
      comparisonHistory = await _getComparisonDataUseCase(comparison.pairCode);

      final latestData = comparisonHistory.first;
      debugPrint('BATATA ${latestData.bid} ${comparison.pairCode}');

      _conversionViewModel.setValues(
        latestData.bid,
        comparison.pairCode.split('-')[0],
        comparison.pairCode.split('-')[1],
      );
    }

    isLoading = false;
    notifyListeners();
  }
}