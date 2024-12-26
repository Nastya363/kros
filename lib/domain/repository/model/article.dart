import 'package:json_annotation/json_annotation.dart';
part 'article.g.dart'; 
@JsonSerializable() 
class Article {
  Article({
    required this.id,
    required this.title,
    required this.explanation,
    required this.url,
    required this.hdurl,
    required this.mediaType,
    required this.date,
    required this.serviceVersion,
    required this.locale,
  });
  final String? id;
  final String? title;
  final String? explanation;
  final String? url;
  final String? hdurl;
  final String? mediaType; // "media_type" в JSON
  final String? date;
  final String? serviceVersion; // "service_version" в JSON
  final String? locale;


  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] as String?,
      title: json['title'] as String?,
      explanation: json['explanation'] as String?,
      url: json['url'] as String?,
      hdurl: json['hdurl'] as String?,
      mediaType: json['media_type'] as String?, 
      date: json['date'] as String?,
      serviceVersion: json['service_version'] as String?, 
      locale: json['locale'] as String?,
    );
  }

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}