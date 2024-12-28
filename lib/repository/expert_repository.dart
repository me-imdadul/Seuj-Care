import 'package:hive/hive.dart';
import 'package:seujcare/models/expert_model.dart';

class ExpertRepository {
  final Box _box = Hive.box('myBox');

  List<ExpertModel> get allexperts {
    try {
      List<Map<dynamic, dynamic>> lists =
          List<Map<dynamic, dynamic>>.from(_box.get('users', defaultValue: []));

      var experts =
          lists.where((element) => element['role'] == 'Expert').toList();

      return experts.map((map) => ExpertModel.fromMap(map)).toList();
    } catch (e) {
      print('Something wrong while fetching users $e');
      return [];
    }
  }

  /// Update farmer details
  Future<String?> updateExpert(String id, ExpertModel expert) async {
    try {
      List<Map<dynamic, dynamic>> lists =
          List<Map<dynamic, dynamic>>.from(_box.get('users', defaultValue: []));

      int index = lists.indexWhere((f) => f['id'] == id);

      if (index != -1) {
        lists[index] = expert.toMap();
        await _box.put('users', lists);
        return null;
      } else {
        return 'Expert not found';
      }
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }

  /// Delete a farmer account
  Future<String?> deleteExpert(String id) async {
    try {
      List<Map<dynamic, dynamic>> experts =
          List<Map<dynamic, dynamic>>.from(_box.get('users', defaultValue: []));
      experts.removeWhere((f) => f['id'] == id);
      await _box.put('users', experts);
      return null;
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }
}
