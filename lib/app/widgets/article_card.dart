import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';
import 'package:go_router/go_router.dart';
//import 'package:flutter_application_1/app/extensions/widget_extensions.dart';
class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key, 
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/home/article' , extra: article);  
      },
      borderRadius: BorderRadius.circular(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article.mediaType == 'image') 
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                article.url ?? '',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title ?? 'No Title',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  article.explanation ?? 'No Description',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

