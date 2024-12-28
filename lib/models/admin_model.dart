// ignore_for_file: public_member_api_docs, sort_constructors_first
class AdminModel {
  final String id;
  final String name;
  final String email;
  final String password;
  String role;

  AdminModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.role = 'Admin',
  });
}
