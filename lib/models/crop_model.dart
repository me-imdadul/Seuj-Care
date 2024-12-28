import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CropModel {
  final String name;
  final String id;
  final String season;
  final String desc;
  CropModel({
    required this.name,
    required this.id,
    required this.season,
    required this.desc,
  });

  CropModel copyWith({
    String? name,
    String? id,
    String? season,
    String? desc,
  }) {
    return CropModel(
      name: name ?? this.name,
      id: id ?? this.id,
      season: season ?? this.season,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'season': season,
      'desc': desc,
    };
  }

  factory CropModel.fromMap(Map<String, dynamic> map) {
    return CropModel(
      name: map['name'] as String,
      id: map['id'] as String,
      season: map['season'] as String,
      desc: map['desc'] as String,
    );
  }
}

List<String> crops = [
  'Wheat',
  'Rice',
  'Maize',
  'Barley',
  'Millet',
  'Sorghum',
  'Soybean',
  'Groundnut',
  'Cotton',
  'Sugarcane',
  'Potato',
  'Tomato',
  'Onion',
  'Cabbage',
  'Cauliflower',
  'Chickpea',
  'Lentil',
  'Mustard',
  'Sunflower',
  'Tea'
];

List<String> cropDiseases = [
  'Rust (Wheat)',
  'Blast (Rice)',
  'Maize Streak Virus',
  'Powdery Mildew',
  'Downy Mildew',
  'Smut (Barley)',
  'Anthracnose (Soybean)',
  'Leaf Spot (Groundnut)',
  'Bollworm (Cotton)',
  'Red Rot (Sugarcane)',
  'Late Blight (Potato)',
  'Early Blight (Tomato)',
  'Purple Blotch (Onion)',
  'Black Rot (Cabbage)',
  'Clubroot (Cauliflower)',
  'Wilt (Chickpea)',
  'Rust (Lentil)',
  'White Rust (Mustard)',
  'Alternaria (Sunflower)',
  'Blister Blight (Tea)'
];
