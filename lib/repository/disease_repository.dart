import 'package:hive/hive.dart';
import 'package:seujcare/models/disease_model.dart';

class DiseaseRepository {
  final Box box = Hive.box('myBox');

  /// Insert a new disease
  Future<String?> insertDisease(DiseaseModel disease) async {
    try {
      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
          box.get('diseases', defaultValue: []));

      list.add(disease.toMap());
      await box.put('diseases', list);
      return null;
    } catch (e) {
      return "Something went wrong. $e";
    }
  }

  /// Delete a disease by index
  Future<String?> deleteDisease(int index) async {
    try {
      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
          box.get('diseases', defaultValue: []));

      list.removeAt(index);

      await box.put('diseases', list);
      return null;
    } catch (e) {
      return "Something went wrong. $e";
    }
  }

  /// Retrieve all diseases
  List<DiseaseModel> get diseaseList {
    try {
      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
          box.get('diseases', defaultValue: []));
      return list.map((map) => DiseaseModel.fromMap(map)).toList();
    } catch (e) {
      return [];
    }
  }

  /// Update a disease by index
  Future<String?> updateDisease(int index, DiseaseModel updatedDisease) async {
    try {
      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
          box.get('diseases', defaultValue: []));

      list[index] = updatedDisease.toMap();

      await box.put('diseases', list);
      return null;
    } catch (e) {
      return "Something went wrong. $e";
    }
  }
}
