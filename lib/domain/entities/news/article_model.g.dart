// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      Source.fromJson(json['source'] as Map<String, dynamic>),
      json['author'] as String?,
      json['title'] as String,
      json['description'] as String?,
      json['url'] as String,
      json['urlToImage'] as String?,
      json['publishedAt'] as String,
      json['content'] as String?,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
      'content': instance.content,
      'title': instance.title,
      'url': instance.url,
      'publishedAt': instance.publishedAt,
      'source': instance.source.toJson(),
    };
