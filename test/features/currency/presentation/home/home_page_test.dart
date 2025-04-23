import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:compare_cambio/features/currency/presentation/home/home_page.dart';
import 'package:compare_cambio/features/currency/presentation/home/viewmodel/home_view_model.dart';
import 'package:compare_cambio/features/currency/domain/model/available_comparison.dart';
import 'package:provider/provider.dart';

import 'home_page_test.mocks.dart';


@GenerateMocks([HomeViewModel])
void main() {
  late MockHomeViewModel mockViewModel;

  setUp(() {
    mockViewModel = MockHomeViewModel();
    final getIt = GetIt.instance;
    if (getIt.isRegistered<HomeViewModel>()) {
      getIt.unregister<HomeViewModel>();
    }
    getIt.registerSingleton<HomeViewModel>(mockViewModel);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: const HomePage(),
    );
  }

  testWidgets('should show loading spinner when isLoading is true', (WidgetTester tester) async {
    when(mockViewModel.isLoading).thenReturn(true);
    when(mockViewModel.comparisons).thenReturn([]);
    when(mockViewModel.selectedComparison).thenReturn(null);

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<HomeViewModel>.value(
          value: mockViewModel,
          child: const HomePage(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should show filtered results ignoring diacritics', (WidgetTester tester) async {
    when(mockViewModel.isLoading).thenReturn(false);
    when(mockViewModel.comparisons).thenReturn([
      AvailableComparison(pairCode: 'USD-BRL', label: 'Dólar/Real'),
      AvailableComparison(pairCode: 'EUR-BRL', label: 'Euro/Real'),
    ]);
    when(mockViewModel.selectedComparison).thenReturn(null);

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DropdownSearch<AvailableComparison>));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'dolar');
    await tester.pumpAndSettle();

    expect(find.text('Dólar/Real'), findsOneWidget);
  });
}