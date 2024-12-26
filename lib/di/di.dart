import 'package:flutter_application_1/app/features/details/blocs/details_bloc.dart';
import 'package:flutter_application_1/domain/repository/inside_top_news/inside_top_news_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/dio/set_up.dart';
import 'package:flutter_application_1/app/features/home/bloc/home_bloc.dart';
import 'package:flutter_application_1/domain/repository/top_news/top_news_repository.dart';
final getIt = GetIt.instance;
final talker = TalkerFlutter.init();
final Dio dio = Dio();
Future<void> setupLocator() async {
    setUpDio();
    getIt.registerSingleton(talker);
    getIt.registerSingleton(TopNewsRepository(dio: getIt<Dio>(), endpoint: ''));
    getIt.registerSingleton(InsideTopNewsRepository(dio: getIt<Dio>(), endpoint: ''));
    getIt.registerSingleton(HomeBloc(getIt.get<TopNewsRepository>()));
    getIt.registerSingleton(DetailsBloc(getIt.get<InsideTopNewsRepository>()));
}


