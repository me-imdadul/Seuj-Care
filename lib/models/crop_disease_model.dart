import 'dart:convert';

class CropDiseaseModel {
  final String id;
  final String name;
  final String season;
  final String symptoms;
  final String diseaseName;
  final String condition;
  final String stage;
  final List<String> diseaseImage;
  final String information;
  final String treatment;
  final List<String> suggestedFertilizer;
  CropDiseaseModel({
    required this.id,
    required this.name,
    required this.season,
    required this.symptoms,
    required this.diseaseName,
    required this.condition,
    required this.stage,
    required this.diseaseImage,
    required this.information,
    required this.treatment,
    required this.suggestedFertilizer,
  });

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'id': id,
      'name': name,
      'season': season,
      'symptoms': symptoms,
      'diseaseName': diseaseName,
      'condition': condition,
      'stage': stage,
      'diseaseImage': diseaseImage,
      'information': information,
      'treatment': treatment,
      'suggestedFertilizer': suggestedFertilizer,
    };
  }

  factory CropDiseaseModel.fromMap(Map<dynamic, dynamic> map) {
    return CropDiseaseModel(
      id: map['id'] as String,
      name: map['name'] as String,
      season: map['season'] as String,
      symptoms: map['symptoms'] as String,
      diseaseName: map['diseaseName'] as String,
      condition: map['condition'] as String,
      stage: map['stage'] as String,
      diseaseImage: List<String>.from((map['diseaseImage'] as List<String>)),
      information: map['information'] as String,
      treatment: map['treatment'] as String,
      suggestedFertilizer:
          List<String>.from((map['suggestedFertilizer'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CropDiseaseModel.fromJson(String source) =>
      CropDiseaseModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);
}

List<String> cropslist = [
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

// List<String> cropDiseases = [
//   'Rust (Wheat)',
//   'Blast (Rice)',
//   'Maize Streak Virus',
//   'Powdery Mildew',
//   'Downy Mildew',
//   'Smut (Barley)',
//   'Anthracnose (Soybean)',
//   'Leaf Spot (Groundnut)',
//   'Bollworm (Cotton)',
//   'Red Rot (Sugarcane)',
//   'Late Blight (Potato)',
//   'Early Blight (Tomato)',
//   'Purple Blotch (Onion)',
//   'Black Rot (Cabbage)',
//   'Clubroot (Cauliflower)',
//   'Wilt (Chickpea)',
//   'Rust (Lentil)',
//   'White Rust (Mustard)',
//   'Alternaria (Sunflower)',
//   'Blister Blight (Tea)'
// ];
