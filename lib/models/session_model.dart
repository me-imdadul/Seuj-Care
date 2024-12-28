// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:seujcare/models/admin_model.dart';
import 'package:seujcare/models/expert_model.dart';
import 'package:seujcare/models/farmer_model.dart';

class SessionModel {
  final DateTime created;
  final DateTime expireIn;
  final FarmerModel? farmer;
  final ExpertModel? expert;
  final AdminModel? admin;
  final String role;
  SessionModel({
    required this.created,
    required this.expireIn,
    this.farmer,
    this.expert,
    this.admin,
    required this.role,
  });
}
