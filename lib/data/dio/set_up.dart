import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:flutter_application_1/di/di.dart';
void setUpDio() {
 dio.options.baseUrl = 'https://api.nasa.gov/planetary/apod'; // общая часть адресов запросов
dio.options.queryParameters.clear(); // Очищаем любые ранее добавленные параметры
dio.options.queryParameters['api_key'] = 'zfPd8bEus78wCV49Y8iNsE85uGbwkwDRdLIv6gWd';
dio.options.queryParameters['count'] = '10'; 
 dio.options.connectTimeout = const Duration(minutes: 1);
 dio.options.receiveTimeout = const Duration(minutes: 1);
 dio.interceptors.addAll([
 TalkerDioLogger(
 talker: talker,
 settings: const TalkerDioLoggerSettings(
 printRequestData: true,
 printRequestHeaders: true,
 ),
 ),
 ]);
  
  getIt.registerSingleton<Dio>(dio);
}