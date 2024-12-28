import 'package:hive/hive.dart';
import 'package:seujcare/models/farmer_model.dart';

class FarmerRepository {
  final Box box = Hive.box('myBox');

  /// Sign up a new farmer
  Future<String?> signUp(FarmerModel farmer) async {
    try {
      List<Map<String, dynamic>> farmers =
          box.get('farmers', defaultValue: [])!;
      // Ensure the email is unique
      if (farmers.any((f) => f['email'] == farmer.email)) {
        print('Email already exists');
      }
      farmers.add(farmer.toMap());
      await box.put('farmers', farmers);
      return null;
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }

  /// Login a farmer
  FarmerModel? login(String email, String password) {
    List<Map<String, dynamic>> farmers = box.get('farmers', defaultValue: [])!;
    try {
      final farmerMap = farmers.firstWhere(
        (f) => f['email'] == email && f['password'] == password,
      );
      return FarmerModel.fromMap(farmerMap);
    } catch (e) {
      return null; // Login failed
    }
  }

  /// Retrieve all farmers
  List<FarmerModel> get allFarmers {
    try {
      List<Map<String, dynamic>> farmers =
          List<Map<String, dynamic>>.from(box.get('farmers', defaultValue: []));
      return farmers.map((map) => FarmerModel.fromMap(map)).toList();
    } catch (e) {
      return [];
    }
  }

  /// Update farmer details
  Future<String?> updateFarmer(String id, FarmerModel updatedFarmer) async {
    try {
      List<Map<String, dynamic>> farmers =
          box.get('farmers', defaultValue: [])!;
      int index = farmers.indexWhere((f) => f['id'] == id);
      if (index != -1) {
        farmers[index] = updatedFarmer.toMap();
        await box.put('farmers', farmers);
        return null;
      } else {
        return 'Farmer not found';
      }
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }

  /// Delete a farmer account
  Future<String?> deleteFarmer(String id) async {
    try {
      List<Map<String, dynamic>> farmers =
          box.get('farmers', defaultValue: [])!;
      farmers.removeWhere((f) => f['id'] == id);
      await box.put('farmers', farmers);
      return null;
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }
}
