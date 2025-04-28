import 'package:compare_cambio/features/currency/domain/repository/available_comparison_repository.dart.dart';
import 'package:compare_cambio/features/currency/domain/usecase/get_available_currencies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:compare_cambio/features/currency/domain/model/available_comparison.dart';

import 'get_available_comparisons_usecase_test.mocks.dart';

@GenerateMocks([AvailableComparisonRepository])
void main() {
  late MockAvailableComparisonRepository mockRepository;
  late GetAvailableComparisonsUseCase useCase;

  final fakeComparisons = [
    AvailableComparison(pairCode: 'USD-BRL', label: 'Dólar/Real'),
    AvailableComparison(pairCode: 'EUR-BRL', label: 'Euro/Real'),
  ];

  setUp(() {
    mockRepository = MockAvailableComparisonRepository();
    useCase = GetAvailableComparisonsUseCase(mockRepository);
  });

  test('should return list of comparisons from repository', () async {
    when(mockRepository.getAvailableComparisons()).thenAnswer((_) async => fakeComparisons);

    final result = await useCase();

    verify(mockRepository.getAvailableComparisons()).called(1);
    expect(result, fakeComparisons);
  });
}
