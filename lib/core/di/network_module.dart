import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() => Dio(BaseOptions(
    // baseUrl: 'https://currency-watchdog.onrender.com/',
    baseUrl: 'https://economia.awesomeapi.com.br/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10)
  ));
}