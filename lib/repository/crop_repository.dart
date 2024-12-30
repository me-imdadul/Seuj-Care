import 'package:hive/hive.dart';
import 'package:seujcare/models/crop_model.dart';
import 'package:seujcare/models/disease_model.dart';

class CropRepository {
  final Box box = Hive.box('myBox');

  /// Insert a new disease
  Future<String?> addCrop(CropModel crop) async {
    try {
      List<Map<dynamic, dynamic>> list =
          List<Map<dynamic, dynamic>>.from(box.get('crops', defaultValue: []));

      list.add(crop.toMap());
      await box.put('crops', list);
      return null;
    } catch (e) {
      return "Something went wrong. $e";
    }
  }

  /// Delete a disease by index
  Future<String?> deleteCrop(int index) async {
    try {
      List<Map<dynamic, dynamic>> list =
          List<Map<dynamic, dynamic>>.from(box.get('crops', defaultValue: []));

      list.removeAt(index);
      await box.put('crops', list);
      return null;
    } catch (e) {
      return "Something went wrong. $e";
    }
  }

  /// Retrieve all diseases
  List<CropModel> get cropList {
    try {
      List<Map<dynamic, dynamic>> list =
          List<Map<dynamic, dynamic>>.from(box.get('crops', defaultValue: []));
      return list.map((map) => CropModel.fromMap(map)).toList();
    } catch (e) {
      return [];
    }
  }

  /// Update a disease by index
  Future<String?> updateCrop(int index, CropModel crop) async {
    try {
      List<Map<dynamic, dynamic>> list =
          List<Map<dynamic, dynamic>>.from(box.get('crops', defaultValue: []));

      list[index] = crop.toMap();

      await box.put('crops', list);
      return null;
    } catch (e) {
      return "Something went wrong. $e";
    }
  }
}
