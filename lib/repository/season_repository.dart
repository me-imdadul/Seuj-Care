import 'package:hive/hive.dart';
import 'package:seujcare/models/season_model.dart';

class SeasonRepository {
  Box box = Hive.box('myBox');

  Future<String?> insertSeason(SeasonModel season) async {
    try {
      List<Map<dynamic, dynamic>> list = List<Map<dynamic, dynamic>>.from(
          box.get('seasons', defaultValue: []));
      list.add(season.toMap());
      await box.put('seasons', list);
      return null;
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }

  Future<String?> updateSeason(int index, SeasonModel season) async {
    try {
      List<Map<dynamic, dynamic>> list = List<Map<dynamic, dynamic>>.from(
          box.get('seasons', defaultValue: []));

      list[index] = season.toMap();

      await box.put('seasons', list);
      return null;
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }

  Future<String?> deleteSeason(int index) async {
    try {
      List<Map<dynamic, dynamic>> list = List<Map<dynamic, dynamic>>.from(
          box.get('seasons', defaultValue: []));

      list.removeAt(index);
      await box.put('seasons', list);

      return null;
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }

  List<SeasonModel> get allSeasons {
    try {
      List<Map<dynamic, dynamic>> list = List<Map<dynamic, dynamic>>.from(
          box.get('seasons', defaultValue: []));
      return list.map((map) => SeasonModel.fromMap(map)).toList();
    } catch (e) {
      return [];
    }
  }
}
