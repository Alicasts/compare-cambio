import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/available_comparison.dart';
import '../../domain/model/comparison_data.dart';
import '../../domain/usecase/get_available_currencies_usecase.dart';
import '../../domain/usecase/get_comparison_data_usecase.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final GetAvailableComparisonsUseCase _getComparisons;
  final GetComparisonDataUseCase _getComparisonDataUseCase;

  HomeViewModel(
      this._getComparisons,
      this._getComparisonDataUseCase,
      );

  bool isLoading = false;
  List<AvailableComparison> comparisons = [];
  AvailableComparison? selectedComparison;
  List<ComparisonData> comparisonHistory = [];

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

    if (comparison == null) return;

    isLoading = true;
    notifyListeners();

    try {
      comparisonHistory = await _getComparisonDataUseCase(comparison.pairCode, 15);
    } catch (e) {
      comparisonHistory = [];
    }

    isLoading = false;
    notifyListeners();
  }
}