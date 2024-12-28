import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CropModel {
  final String name;
  final String description;
  final String season;
  final String information;
  final String harvestingDays;
  final String wateringSchedule;
  final List<String> fertilizationPlan;
  final String suggestions;
  final String cropUrl;
  CropModel({
    required this.name,
    required this.description,
    required this.season,
    required this.information,
    required this.harvestingDays,
    required this.wateringSchedule,
    required this.fertilizationPlan,
    required this.suggestions,
    required this.cropUrl,
  });

  CropModel copyWith({
    String? name,
    String? description,
    String? season,
    String? information,
    String? harvestingDays,
    String? wateringSchedule,
    List<String>? fertilizationPlan,
    String? suggestions,
    String? cropUrl,
  }) {
    return CropModel(
      name: name ?? this.name,
      description: description ?? this.description,
      season: season ?? this.season,
      information: information ?? this.information,
      harvestingDays: harvestingDays ?? this.harvestingDays,
      wateringSchedule: wateringSchedule ?? this.wateringSchedule,
      fertilizationPlan: fertilizationPlan ?? this.fertilizationPlan,
      suggestions: suggestions ?? this.suggestions,
      cropUrl: cropUrl ?? this.cropUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'season': season,
      'information': information,
      'harvestingDays': harvestingDays,
      'wateringSchedule': wateringSchedule,
      'fertilizationPlan': fertilizationPlan,
      'suggestions': suggestions,
      'cropUrl': cropUrl,
    };
  }

  factory CropModel.fromMap(Map<String, dynamic> map) {
    return CropModel(
      name: map['name'] as String,
      description: map['description'] as String,
      season: map['season'] as String,
      information: map['information'] as String,
      harvestingDays: map['harvestingDays'] as String,
      wateringSchedule: map['wateringSchedule'] as String,
      fertilizationPlan:
          List<String>.from((map['fertilizationPlan'] as List<String>)),
      suggestions: map['suggestions'] as String,
      cropUrl: map['cropUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CropModel.fromJson(String source) =>
      CropModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
