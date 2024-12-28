import 'package:hive/hive.dart';
import 'package:seujcare/models/crop_disease_model.dart';

class CropDiseaseRepository {
  final Box box = Hive.box('myBox');

  Future<String?> addCropDisease(CropDiseaseModel cropDisease) async {
    try {
      List<Map<dynamic, dynamic>> list = List<Map<dynamic, dynamic>>.from(box
          .get('cropDisease', defaultValue: []).cast<Map<dynamic, dynamic>>());
      list.add(cropDisease.toMap());
      await box.put('cropDisease', list);
      return null;
    } catch (e) {
      return "Something went wrong adding crops. $e";
    }
  }

  List<CropDiseaseModel> getCrops() {
    try {
      List<Map<dynamic, dynamic>> list = List<Map<dynamic, dynamic>>.from(
          box.get('cropDisease', defaultValue: []));

      return list
          .map((cropDisease) => CropDiseaseModel.fromMap(cropDisease))
          .toList();
    } catch (e) {
      print('Something wrong while fetching crop diseases $e');
      return [];
    }
  }

  Future<String?> updateCropDisease(
      int index, CropDiseaseModel updatedCropDisease) async {
    try {
      List<Map<dynamic, dynamic>> list = List<Map<dynamic, dynamic>>.from(
          box.get('cropDisease', defaultValue: []));

      if (index >= 0 && index < list.length) {
        list[index] = updatedCropDisease.toMap();
        await box.put('cropDisease', list);
        return null;
      } else {
        return "Invalid index";
      }
    } catch (e) {
      return "Error: $e";
    }
  }

  Future<String?> deleteCropDisease(int index) async {
    try {
      List<Map<dynamic, dynamic>> list = List<Map<dynamic, dynamic>>.from(
          box.get('cropDisease', defaultValue: []));

      if (index >= 0 && index < list.length) {
        list.removeAt(index);
        await box.put('cropDisease', list);
        return null;
      } else {
        return "Invalid index";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
