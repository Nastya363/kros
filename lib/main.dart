import 'package:flutter/material.dart';
import 'package:flutter_application_1/di/di.dart';
import 'package:flutter_application_1/news_brief.dart';
void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 setupLocator();
 FlutterError.onError = (details) => talker.handle(
 details.exception,
 details.stack,
 );
 runApp(const NewsBriefApp()); 
}