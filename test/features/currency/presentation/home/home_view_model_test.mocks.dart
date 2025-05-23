// Mocks generated by Mockito 5.4.5 from annotations
// in compare_cambio/test/features/currency/presentation/home/home_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i10;

import 'package:compare_cambio/features/currency/domain/model/available_comparison.dart'
    as _i5;
import 'package:compare_cambio/features/currency/domain/model/comparison_data.dart'
    as _i7;
import 'package:compare_cambio/features/currency/domain/repository/comparison_repository.dart'
    as _i2;
import 'package:compare_cambio/features/currency/domain/usecase/get_available_currencies_usecase.dart'
    as _i3;
import 'package:compare_cambio/features/currency/domain/usecase/get_comparison_data_usecase.dart'
    as _i6;
import 'package:compare_cambio/features/currency/presentation/home/viewmodel/currency_conversion_view_model.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeComparisonRepository_0 extends _i1.SmartFake
    implements _i2.ComparisonRepository {
  _FakeComparisonRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetAvailableComparisonsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAvailableComparisonsUseCase extends _i1.Mock
    implements _i3.GetAvailableComparisonsUseCase {
  MockGetAvailableComparisonsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.AvailableComparison>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i4.Future<List<_i5.AvailableComparison>>.value(
            <_i5.AvailableComparison>[]),
      ) as _i4.Future<List<_i5.AvailableComparison>>);
}

/// A class which mocks [GetComparisonDataUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetComparisonDataUseCase extends _i1.Mock
    implements _i6.GetComparisonDataUseCase {
  MockGetComparisonDataUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ComparisonRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeComparisonRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.ComparisonRepository);

  @override
  _i4.Future<List<_i7.ComparisonData>> call(
    String? pairCode, [
    int? days = 15,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [
            pairCode,
            days,
          ],
        ),
        returnValue:
            _i4.Future<List<_i7.ComparisonData>>.value(<_i7.ComparisonData>[]),
      ) as _i4.Future<List<_i7.ComparisonData>>);
}

/// A class which mocks [CurrencyConversionViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockCurrencyConversionViewModel extends _i1.Mock
    implements _i8.CurrencyConversionViewModel {
  MockCurrencyConversionViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double get baseAmount => (super.noSuchMethod(
        Invocation.getter(#baseAmount),
        returnValue: 0.0,
      ) as double);

  @override
  double get convertedAmount => (super.noSuchMethod(
        Invocation.getter(#convertedAmount),
        returnValue: 0.0,
      ) as double);

  @override
  String get baseCurrency => (super.noSuchMethod(
        Invocation.getter(#baseCurrency),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.getter(#baseCurrency),
        ),
      ) as String);

  @override
  String get targetCurrency => (super.noSuchMethod(
        Invocation.getter(#targetCurrency),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.getter(#targetCurrency),
        ),
      ) as String);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void setValues(
    double? rate,
    String? base,
    String? target,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #setValues,
          [
            rate,
            base,
            target,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updateAmount(
    double? value, {
    required bool? isBase,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #updateAmount,
          [value],
          {#isBase: isBase},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i10.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i10.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
