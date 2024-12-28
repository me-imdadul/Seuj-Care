import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DiseaseModel {
  final String name;
  final String id;
  final String category;
  DiseaseModel({
    required this.name,
    required this.id,
    required this.category,
  });

  DiseaseModel copyWith({
    String? name,
    String? id,
    String? category,
  }) {
    return DiseaseModel(
      name: name ?? this.name,
      id: id ?? this.id,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'category': category,
    };
  }

  factory DiseaseModel.fromMap(Map<String, dynamic> map) {
    return DiseaseModel(
      name: map['name'] as String,
      id: map['id'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiseaseModel.fromJson(String source) =>
      DiseaseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DiseaseModel(name: $name, id: $id, category: $category)';

  @override
  bool operator ==(covariant DiseaseModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id && other.category == category;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ category.hashCode;
}
