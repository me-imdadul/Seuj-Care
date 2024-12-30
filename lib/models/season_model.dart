// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SeasonModel {
  final String name;
  final String information;
  final String image;
  final List<String> crops;
  SeasonModel({
    required this.name,
    required this.information,
    required this.image,
    required this.crops,
  });

  SeasonModel copyWith({
    String? name,
    String? information,
    String? image,
    List<String>? crops,
  }) {
    return SeasonModel(
      name: name ?? this.name,
      information: information ?? this.information,
      image: image ?? this.image,
      crops: crops ?? this.crops,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'name': name,
      'information': information,
      'image': image,
      'crops': crops,
    };
  }

  factory SeasonModel.fromMap(Map<dynamic, dynamic> map) {
    return SeasonModel(
        name: map['name'] as String,
        information: map['information'] as String,
        image: map['image'] as String,
        crops: List<String>.from(
          (map['crops'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory SeasonModel.fromJson(String source) =>
      SeasonModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);
}
