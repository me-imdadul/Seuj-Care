import 'package:hive/hive.dart';
import 'package:seujcare/models/crop_model.dart';

class CropRepository {
  final Box box = Hive.box('myBox');

  Future<String?> addCropDetails(CropModel crop) async {
    try {
      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(box.get('crops'));

      Map<String, dynamic> cropDetails = {
        'name': crop.name,
        'description': crop.desc,
        'season': crop.season,
        'info': crop.season,
        'harvesting_days': crop.season,
        'watering_schedule': crop.season,
        'fertilization_plan': crop.season,
        'suggestions': crop.season,
        'crop_url': crop.season,
      };

      list.add(cropDetails);
      await box.put('crops', list);
      return null;
    } catch (e) {
      return "Error $e";
    }
  }

  Future<List<CropModel>> getCrops() async {
    try {
      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(box.get('crops', defaultValue: []));

      return list.map((crop) => CropModel.fromMap(crop)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<String?> updateCropDetails(int index, CropModel updatedCrop) async {
    try {
      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(box.get('crops', defaultValue: []));

      if (index >= 0 && index < list.length) {
        list[index] = updatedCrop.toMap();
        await box.put('crops', list);
        return null;
      } else {
        return "Invalid index";
      }
    } catch (e) {
      return "Error: $e";
    }
  }

  Future<String?> deleteCrop(int index) async {
    try {
      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(box.get('crops', defaultValue: []));

      if (index >= 0 && index < list.length) {
        list.removeAt(index);
        await box.put('crops', list);
        return null;
      } else {
        return "Invalid index";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
