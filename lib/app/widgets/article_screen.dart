import 'package:flutter/material.dart';
//import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;

  const ArticleScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Детали новостей'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.mediaType == 'image' && article.url != null)
                Center(
                  child: Image.network(article.url!),
                ),
              const SizedBox(height: 20),
              Text(
                article.title ?? 'No Title',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                article.explanation ?? 'No Description',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

