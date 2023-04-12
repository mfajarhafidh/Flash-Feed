import 'dart:convert';

SourceListModel sourceListModelFromJson(String str) =>
    SourceListModel.fromJson(json.decode(str));

class SourceListModel {
  SourceListModel({
    this.status,
    this.sources,
  });

  String? status;
  List<Source>? sources;

  factory SourceListModel.fromJson(Map<String, dynamic> json) =>
      SourceListModel(
        status: json["status"],
        sources: json["sources"] == null
            ? []
            : List<Source>.from(
                json["sources"]!.map((x) => Source.fromJson(x))),
      );
}

class Source {
  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  String? id;
  String? name;
  String? description;
  String? url;
  Category? category;
  String? language;
  String? country;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        category: categoryValues.map[json["category"]]!,
        language: json["language"],
        country: json["country"],
      );
}

enum Category {
  GENERAL,
  BUSINESS,
  TECHNOLOGY,
  SPORTS,
  ENTERTAINMENT,
  HEALTH,
  SCIENCE
}

final categoryValues = EnumValues({
  "business": Category.BUSINESS,
  "entertainment": Category.ENTERTAINMENT,
  "general": Category.GENERAL,
  "health": Category.HEALTH,
  "science": Category.SCIENCE,
  "sports": Category.SPORTS,
  "technology": Category.TECHNOLOGY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
