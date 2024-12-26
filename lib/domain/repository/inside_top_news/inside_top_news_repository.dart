import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';
import 'package:flutter_application_1/domain/repository/inside_top_news/inside_top_news_repository_interface.dart';
//import 'package:flutter_application_1/data/endpoints.dart';
class InsideTopNewsRepository extends InsideTopNewsRepositoryInterface {
  InsideTopNewsRepository({required this.dio, 
  required this.endpoint});
  
final Dio dio;
final String endpoint;

@override
Future<Article> getTopNews(int index) async {
  try {
    final Response response = await dio.get(endpoint);

    if (response.statusCode == 200) {
      final List<dynamic> articles = response.data; // Предполагаем, что ответ - это список статей

      if (index < 0 || index >= articles.length) {
        throw Exception('Index out of bounds: $index');
      }

      final Article selectedArticle = Article.fromJson(articles[index]); // Получаем статью по индексу
      return selectedArticle;
    } else {
      throw Exception('Failed to load top news: ${response.statusCode}');
    }
  } on DioException catch (e) {
    throw e.message.toString();
  }
}



}