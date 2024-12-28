import 'dart:convert';

class FarmerModel {
  final String name;
  final String phone;
  final String id;
  final String email;
  final String password;
  final String profilePic;
  String role;

  FarmerModel({
    required this.name,
    required this.phone,
    required this.id,
    required this.email,
    required this.password,
    required this.profilePic,
    this.role = 'Farmer',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'id': id,
      'email': email,
      'password': password,
      'profilePic': profilePic,
      'role': role,
    };
  }

  factory FarmerModel.fromMap(Map<String, dynamic> map) {
    return FarmerModel(
      name: map['name'] as String,
      phone: map['phone'] as String,
      id: map['id'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      profilePic: map['profilePic'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FarmerModel.fromJson(String source) =>
      FarmerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
