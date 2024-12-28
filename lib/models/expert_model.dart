// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ExpertModel {
  final String name;
  final String email;
  final String password;
  final List<String> specializations;
  final String desc;
  final List<String> qualifications;
  final String gender;
  final String id;
  final String profileImg;
  String role;

  ExpertModel({
    required this.name,
    required this.email,
    required this.password,
    required this.specializations,
    required this.desc,
    required this.qualifications,
    required this.gender,
    required this.id,
    required this.profileImg,
    this.role = 'Expert',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'specializations': specializations,
      'desc': desc,
      'qualifications': qualifications,
      'gender': gender,
      'id': id,
      'profileImg': profileImg,
      'role': role,
    };
  }

  factory ExpertModel.fromMap(Map<String, dynamic> map) {
    return ExpertModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      specializations:
          List<String>.from((map['specializations'] as List<String>)),
      desc: map['desc'] as String,
      qualifications:
          List<String>.from((map['qualifications'] as List<String>)),
      gender: map['gender'] as String,
      id: map['id'] as String,
      profileImg: map['profileImg'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
