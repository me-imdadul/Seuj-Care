import 'package:hive_flutter/hive_flutter.dart';
import 'package:seujcare/models/admin_model.dart';
import 'package:seujcare/models/expert_model.dart';
import 'package:seujcare/models/farmer_model.dart';

class AuthenticationServices {
  var box = Hive.box('myBox');

  Future<String?> userLogin(String email, String password) async {
    // Retrieve the farmers data
    try {
      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
        (box.get('users', defaultValue: []) as List).map(
          (item) => Map<String, dynamic>.from(item as Map),
        ),
      );

      // Find the index of the farmer by email
      int emailIndex = list.indexWhere((element) => element['email'] == email);

      // Ensure the email exists
      if (emailIndex == -1) {
        return 'No Account Found. Create new!'; // Email not found
      }

      // Check if the password matches
      if (list[emailIndex]['password'] == password) {
        // Store session data
        await box.put('session', list[emailIndex]);
        return null; // Login successful
      } else {
        return 'Password wrong!'; // Password mismatch
      }
    } catch (e) {
      return 'Error $e';
    }
  }

  Future<String?> farmerSignup(FarmerModel farmer) async {
    try {
      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
        (box.get('users', defaultValue: []) as List).map(
          (item) => Map<String, dynamic>.from(item as Map),
        ),
      );

      // find index where email already exists
      int index = list.indexWhere(
        (element) => element['email'] == farmer.email,
      );

      if (index == -1) {
        Map<String, dynamic> data = {
          'id': farmer.id,
          'name': farmer.name,
          'email': farmer.email,
          'password': farmer.password,
          'profileImg': farmer.profilePic,
          'role': 'Farmer'
        };

        list.add(data);
        await box.put('users', list);
        return null;
      }
      return "Email already exists";
    } catch (e) {
      return "Error $e";
    }
  }

  Future<String?> expertSignup(ExpertModel expert) async {
    try {
      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
        (box.get('users', defaultValue: []) as List).map(
          (item) => Map<String, dynamic>.from(item as Map),
        ),
      );

      // find index where email already exists
      int index = list.indexWhere(
        (element) => element['email'] == expert.email,
      );

      if (index == -1) {
        Map<String, dynamic> data = {
          'id': expert.id,
          'name': expert.name,
          'email': expert.email,
          'password': expert.password,
          'profileImg': expert.profileImg,
          'qualification': expert.qualifications,
          'gender': expert.gender,
          'desc': expert.desc,
          'specialization': expert.specializations,
          'role': 'Expert'
        };

        list.add(data);
        await box.put('users', list);
        return null;
      }
      return "Email already exists";
    } catch (e) {
      return 'Error $e';
    }
  }

  Future<String?> adminSignup(AdminModel admin) async {
    try {
      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
        (box.get('users', defaultValue: []) as List).map(
          (item) => Map<String, dynamic>.from(item as Map),
        ),
      );

      int index = list.indexWhere(
        (element) => element['email'] == admin.email,
      );

      if (index < 0) {
        return "Email already exists";
      }

      Map<String, dynamic> data = {
        'id': admin.id,
        'name': admin.name,
        'email': admin.email,
        'password': admin.password,
        'role': 'Admin'
      };

      list.add(data);
      await box.put('users', list);
      return null;
    } catch (e) {
      return 'Error $e';
    }
  }

  Future<String?> logOut() async {
    try {
      await box.delete('session');
      return null;
    } catch (e) {
      return 'Error $e';
    }
  }
}
