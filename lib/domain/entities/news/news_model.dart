import 'package:json_annotation/json_annotation.dart';
import 'article_model.dart';

part 'news_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsModel {
  NewsModel({this.status, this.totalResults, this.articles});

  String? status;
  int? totalResults;
  List<ArticleModel>? articles;

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}
