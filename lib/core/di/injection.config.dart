// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:compare_cambio/core/di/network_module.dart' as _i200;
import 'package:compare_cambio/features/currency/data/mapper/comparison_data_mapper.dart'
    as _i660;
import 'package:compare_cambio/features/currency/data/repository/available_comparison_repository_impl.dart'
    as _i125;
import 'package:compare_cambio/features/currency/data/repository/comparison_repository_impl.dart'
    as _i1042;
import 'package:compare_cambio/features/currency/data/services/currency_api_service.dart'
    as _i99;
import 'package:compare_cambio/features/currency/data/storage/local_available_comparison_storage_service.dart'
    as _i1;
import 'package:compare_cambio/features/currency/data/storage/local_comparison_data_storage_service.dart'
    as _i963;
import 'package:compare_cambio/features/currency/domain/repository/available_comparison_repository.dart.dart'
    as _i319;
import 'package:compare_cambio/features/currency/domain/repository/comparison_repository.dart'
    as _i789;
import 'package:compare_cambio/features/currency/domain/usecase/get_available_currencies_usecase.dart'
    as _i827;
import 'package:compare_cambio/features/currency/domain/usecase/get_comparison_data_usecase.dart'
    as _i884;
import 'package:compare_cambio/features/currency/presentation/home/viewmodel/currency_conversion_view_model.dart'
    as _i895;
import 'package:compare_cambio/features/currency/presentation/home/viewmodel/home_view_model.dart'
    as _i485;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i660.ComparisonDataMapper>(() => _i660.ComparisonDataMapper());
    gh.factory<_i895.CurrencyConversionViewModel>(
        () => _i895.CurrencyConversionViewModel());
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i1.LocalAvailableComparisonStorageService>(
        () => _i1.LocalAvailableComparisonStorageService());
    gh.lazySingleton<_i963.LocalComparisonDataStorageService>(
        () => _i963.LocalComparisonDataStorageService());
    gh.lazySingleton<_i99.CurrencyApiService>(
        () => _i99.CurrencyApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i319.AvailableComparisonRepository>(
        () => _i125.AvailableComparisonRepositoryImpl(
              gh<_i99.CurrencyApiService>(),
              gh<_i1.LocalAvailableComparisonStorageService>(),
            ));
    gh.lazySingleton<_i789.ComparisonRepository>(
        () => _i1042.ComparisonRepositoryImpl(
              gh<_i99.CurrencyApiService>(),
              gh<_i660.ComparisonDataMapper>(),
              gh<_i963.LocalComparisonDataStorageService>(),
            ));
    gh.factory<_i827.GetAvailableComparisonsUseCase>(() =>
        _i827.GetAvailableComparisonsUseCase(
            gh<_i319.AvailableComparisonRepository>()));
    gh.factory<_i884.GetComparisonDataUseCase>(
        () => _i884.GetComparisonDataUseCase(gh<_i789.ComparisonRepository>()));
    gh.factory<_i485.HomeViewModel>(() => _i485.HomeViewModel(
          gh<_i827.GetAvailableComparisonsUseCase>(),
          gh<_i884.GetComparisonDataUseCase>(),
          gh<_i895.CurrencyConversionViewModel>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i200.NetworkModule {}
