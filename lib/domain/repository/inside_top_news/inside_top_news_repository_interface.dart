import 'dart:async';
//import 'package:flutter_application_1/app/app.dart';
//import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';
//import 'package:flutter_application_1/domain/domain.dart';
abstract class InsideTopNewsRepositoryInterface {
Future<Article> getTopNews(int index);
}