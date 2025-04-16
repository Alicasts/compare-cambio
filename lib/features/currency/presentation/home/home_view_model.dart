import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/available_comparison.dart';
import '../../domain/usecase/get_available_currencies_usecase.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final GetAvailableComparisonsUseCase _getComparisons;

  HomeViewModel(this._getComparisons);

  bool isLoading = false;
  List<AvailableComparison> comparisons = [];
  AvailableComparison? selectedComparison;

  Future<void> fetchComparisons() async {
    isLoading = true;
    notifyListeners();

    try {
      comparisons = await _getComparisons();
    } catch (e) {
      debugPrint('Error fetching list: $e');
      comparisons = [];
    }

    isLoading = false;
    notifyListeners();
  }

  void selectComparison(AvailableComparison? comparison) {
    selectedComparison = comparison;
    notifyListeners();
  }
}