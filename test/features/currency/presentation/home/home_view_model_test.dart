import 'package:compare_cambio/features/currency/domain/model/comparison_data.dart';
import 'package:compare_cambio/features/currency/domain/usecase/get_available_currencies_usecase.dart';
import 'package:compare_cambio/features/currency/domain/usecase/get_comparison_data_usecase.dart';
import 'package:compare_cambio/features/currency/presentation/home/viewmodel/currency_conversion_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:compare_cambio/features/currency/presentation/home/viewmodel/home_view_model.dart';
import 'package:compare_cambio/features/currency/domain/model/available_comparison.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([
  GetAvailableComparisonsUseCase,
  GetComparisonDataUseCase,
  CurrencyConversionViewModel,
])
void main() {
  late MockGetAvailableComparisonsUseCase mockGetComparisons;
  late MockGetComparisonDataUseCase mockGetComparisonData;
  late MockCurrencyConversionViewModel mockConversionViewModel;
  late HomeViewModel viewModel;

  final fakeComparisons = [
    AvailableComparison(pairCode: 'USD-BRL', label: 'Dólar/Real'),
    AvailableComparison(pairCode: 'EUR-BRL', label: 'Euro/Real'),
  ];

  final fakeData = [
    ComparisonData(
      date: DateTime(2023, 10, 1),
      bid: 5.2,
      ask: 5.25,
      high: 5.3,
      low: 5.1,
      pctChange: 0.45,
    ),
    ComparisonData(
      date: DateTime(2023, 9, 30),
      bid: 5.0,
      ask: 5.05,
      high: 5.1,
      low: 4.95,
      pctChange: -0.38,
    ),
  ];

  setUp(() {
    mockGetComparisons = MockGetAvailableComparisonsUseCase();
    mockGetComparisonData = MockGetComparisonDataUseCase();
    mockConversionViewModel = MockCurrencyConversionViewModel();

    viewModel = HomeViewModel(
      mockGetComparisons,
      mockGetComparisonData,
      mockConversionViewModel,
    );
  });

  test('fetchComparisons should load data and toggle loading', () async {
    when(mockGetComparisons()).thenAnswer((_) async => fakeComparisons);

    expect(viewModel.isLoading, false);

    final future = viewModel.fetchComparisons();
    expect(viewModel.isLoading, true);

    await future;

    expect(viewModel.isLoading, false);
    expect(viewModel.comparisons, equals(fakeComparisons));
  });

  test('fetchComparisons should handle error gracefully', () async {
    when(mockGetComparisons()).thenThrow(Exception('API error'));

    await viewModel.fetchComparisons();

    expect(viewModel.comparisons, isEmpty);
    expect(viewModel.isLoading, false);
  });

  test('selectComparison should update selectedComparison and set conversion data', () async {
    final comparison = AvailableComparison(pairCode: 'USD-BRL', label: 'Dólar/Real');

    when(mockGetComparisonData(any)).thenAnswer((_) async => fakeData);

    await viewModel.selectComparison(comparison);

    expect(viewModel.selectedComparison, comparison);
    expect(viewModel.comparisonHistory, fakeData);

    verify(mockConversionViewModel.setValues(
      fakeData.first.bid,
      'USD',
      'BRL',
    )).called(1);
  });

  test('fetchComparisons should notify listeners', () async {
    when(mockGetComparisons()).thenAnswer((_) async => fakeComparisons);

    var notifyCount = 0;
    viewModel.addListener(() {
      notifyCount++;
    });

    await viewModel.fetchComparisons();

    expect(notifyCount, equals(2));
  });
}
