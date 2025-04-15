// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:compare_cambio/core/di/network_module.dart' as _i200;
import 'package:compare_cambio/features/currency/data/repository/available_currency_repository_impl.dart'
    as _i892;
import 'package:compare_cambio/features/currency/data/services/currency_api_service.dart'
    as _i99;
import 'package:compare_cambio/features/currency/domain/repository/available_currency_repository.dart'
    as _i1044;
import 'package:compare_cambio/features/currency/domain/usecase/get_available_currencies_usecase.dart'
    as _i827;
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
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i99.CurrencyApiService>(
        () => _i99.CurrencyApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i1044.AvailableCurrencyRepository>(() =>
        _i892.AvailableCurrencyRepositoryImpl(gh<_i99.CurrencyApiService>()));
    gh.factory<_i827.GetAvailableCurrenciesUseCase>(() =>
        _i827.GetAvailableCurrenciesUseCase(
            gh<_i1044.AvailableCurrencyRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i200.NetworkModule {}
