import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:compare_cambio/features/currency/data/repository/available_comparison_repository_impl.dart';
import 'package:compare_cambio/features/currency/data/services/currency_api_service.dart';
import 'package:compare_cambio/features/currency/data/storage/local_available_comparison_storage_service.dart';
import 'package:compare_cambio/features/currency/data/dto/available_comparison_dto.dart';
import 'package:compare_cambio/features/currency/domain/mapper/available_comparison_mapper.dart';

import 'available_comparison_repository_impl_test.mocks.dart';

@GenerateMocks([CurrencyApiService, LocalAvailableComparisonStorageService])
void main() {
  late MockCurrencyApiService mockApiService;
  late MockLocalAvailableComparisonStorageService mockLocalStorage;
  late AvailableComparisonRepositoryImpl repository;

  var fakeDtoList = [
    AvailableComparisonDto(pairCode: 'USD-BRL', label: 'Dólar/Real'),
    AvailableComparisonDto(pairCode: 'EUR-BRL', label: 'Euro/Real'),
  ];

  final fakeComparisonList = fakeDtoList.map((dto) => dto.toDomain()).toList();

  setUp(() {
    mockApiService = MockCurrencyApiService();
    mockLocalStorage = MockLocalAvailableComparisonStorageService();
    repository = AvailableComparisonRepositoryImpl(mockApiService, mockLocalStorage);
  });

  test('should return cached data if available', () async {
    when(mockLocalStorage.getAll()).thenReturn(fakeComparisonList);

    final result = await repository.getAvailableComparisons();

    verifyNever(mockApiService.fetchAvailableComparisons());
    verify(mockLocalStorage.getAll()).called(1);
    expect(result, fakeComparisonList);
  });

  test('should fetch from API and save to cache if local is empty', () async {
    when(mockLocalStorage.getAll()).thenReturn([]);
    when(mockApiService.fetchAvailableComparisons()).thenAnswer((_) async => fakeDtoList);
    when(mockLocalStorage.saveAll(any)).thenAnswer((_) async => {});

    final result = await repository.getAvailableComparisons();

    verify(mockApiService.fetchAvailableComparisons()).called(1);
    verify(mockLocalStorage.saveAll(any)).called(1);
    expect(result.map((e) => e.label).toList(), ['Dólar/Real', 'Euro/Real']);

  });
}
