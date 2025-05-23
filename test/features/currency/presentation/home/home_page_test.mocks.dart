// Mocks generated by Mockito 5.4.5 from annotations
// in compare_cambio/test/features/currency/presentation/home/home_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:ui' as _i7;

import 'package:compare_cambio/features/currency/domain/model/available_comparison.dart'
    as _i4;
import 'package:compare_cambio/features/currency/domain/model/comparison_data.dart'
    as _i5;
import 'package:compare_cambio/features/currency/presentation/home/viewmodel/currency_conversion_view_model.dart'
    as _i2;
import 'package:compare_cambio/features/currency/presentation/home/viewmodel/home_view_model.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

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

class _FakeCurrencyConversionViewModel_0 extends _i1.SmartFake
    implements _i2.CurrencyConversionViewModel {
  _FakeCurrencyConversionViewModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HomeViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeViewModel extends _i1.Mock implements _i3.HomeViewModel {
  MockHomeViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isLoading => (super.noSuchMethod(
        Invocation.getter(#isLoading),
        returnValue: false,
      ) as bool);

  @override
  set isLoading(bool? _isLoading) => super.noSuchMethod(
        Invocation.setter(
          #isLoading,
          _isLoading,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i4.AvailableComparison> get comparisons => (super.noSuchMethod(
        Invocation.getter(#comparisons),
        returnValue: <_i4.AvailableComparison>[],
      ) as List<_i4.AvailableComparison>);

  @override
  set comparisons(List<_i4.AvailableComparison>? _comparisons) =>
      super.noSuchMethod(
        Invocation.setter(
          #comparisons,
          _comparisons,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set selectedComparison(_i4.AvailableComparison? _selectedComparison) =>
      super.noSuchMethod(
        Invocation.setter(
          #selectedComparison,
          _selectedComparison,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i5.ComparisonData> get comparisonHistory => (super.noSuchMethod(
        Invocation.getter(#comparisonHistory),
        returnValue: <_i5.ComparisonData>[],
      ) as List<_i5.ComparisonData>);

  @override
  set comparisonHistory(List<_i5.ComparisonData>? _comparisonHistory) =>
      super.noSuchMethod(
        Invocation.setter(
          #comparisonHistory,
          _comparisonHistory,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.CurrencyConversionViewModel get currencyConversionViewModel =>
      (super.noSuchMethod(
        Invocation.getter(#currencyConversionViewModel),
        returnValue: _FakeCurrencyConversionViewModel_0(
          this,
          Invocation.getter(#currencyConversionViewModel),
        ),
      ) as _i2.CurrencyConversionViewModel);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i6.Future<void> fetchComparisons() => (super.noSuchMethod(
        Invocation.method(
          #fetchComparisons,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> selectComparison(_i4.AvailableComparison? comparison) =>
      (super.noSuchMethod(
        Invocation.method(
          #selectComparison,
          [comparison],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  void addListener(_i7.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i7.VoidCallback? listener) => super.noSuchMethod(
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
