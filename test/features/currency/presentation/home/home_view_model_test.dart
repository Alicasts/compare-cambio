import 'package:compare_cambio/features/currency/domain/usecase/get_available_currencies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:compare_cambio/features/currency/presentation/home/home_view_model.dart';
import 'package:compare_cambio/features/currency/domain/model/available_comparison.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([GetAvailableComparisonsUseCase])
void main() {
  late MockGetAvailableComparisonsUseCase mockUseCase;
  late HomeViewModel viewModel;

  final fakeComparisons = [
    AvailableComparison(pairCode: 'USD-BRL', label: 'Dólar/Real'),
    AvailableComparison(pairCode: 'EUR-BRL', label: 'Euro/Real'),
  ];

  setUp(() {
    mockUseCase = MockGetAvailableComparisonsUseCase();
    viewModel = HomeViewModel(mockUseCase);
  });

  test('fetchComparisons should load data and toggle loading', () async {
    when(mockUseCase()).thenAnswer((_) async => fakeComparisons);

    expect(viewModel.isLoading, false);
    final future = viewModel.fetchComparisons();
    expect(viewModel.isLoading, true);

    await future;

    expect(viewModel.isLoading, false);
    expect(viewModel.comparisons, fakeComparisons);
  });

  test('fetchComparisons should handle error gracefully', () async {
    when(mockUseCase()).thenThrow(Exception('API error'));

    await viewModel.fetchComparisons();

    expect(viewModel.comparisons, isEmpty);
    expect(viewModel.isLoading, false);
  });

  test('selectComparison should update selectedComparison', () {
    final comparison = AvailableComparison(pairCode: 'EUR-BRL', label: 'Euro/Real');

    viewModel.selectComparison(comparison);

    expect(viewModel.selectedComparison, comparison);
  });
}
