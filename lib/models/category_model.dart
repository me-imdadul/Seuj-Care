// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  final String name;
  final String imageUrl;
  final String descesc;
  final String condition;
  final String season;
  CategoryModel({
    required this.name,
    required this.imageUrl,
    required this.descesc,
    required this.condition,
    required this.season,
  });

  CategoryModel copyWith({
    String? name,
    String? imageUrl,
    String? descesc,
    String? condition,
    String? season,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      descesc: descesc ?? this.descesc,
      condition: condition ?? this.condition,
      season: season ?? this.season,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
      'descesc': descesc,
      'condition': condition,
      'season': season,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      descesc: map['descesc'] as String,
      condition: map['condition'] as String,
      season: map['season'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(name: $name, imageUrl: $imageUrl, descesc: $descesc, condition: $condition, season: $season)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.imageUrl == imageUrl &&
        other.descesc == descesc &&
        other.condition == condition &&
        other.season == season;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        imageUrl.hashCode ^
        descesc.hashCode ^
        condition.hashCode ^
        season.hashCode;
  }
}
