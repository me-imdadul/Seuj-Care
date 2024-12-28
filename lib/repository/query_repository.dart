import 'package:hive/hive.dart';
import 'package:seujcare/models/query_model.dart';

class QueryRepository {
  Box box = Hive.box('myBox');

  Future<String?> createNewQuery(QueryModel query) async {
    try {
      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(box.get('queries'));
      list.add(query.toMap());
      await box.put('queries', list);
      return null;
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }

  Future<String?> resolveQuery(QueryModel query) async {
    try {
      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(box.get('queries'));
      list.add(query.toMap());
      await box.put('queries', list);
      return null;
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }

  Future<String?> deleteQuery(String id) async {
    try {
      List<Map<String, dynamic>> list = box.get('queries', defaultValue: [])!;
      list.removeWhere((f) => f['queryId'] == id);
      await box.put('queries', list);
      return null;
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }

  Future<QueryModel> getQueryDetails(String queryId) async {
    List<Map<String, dynamic>> list =
        List<Map<String, dynamic>>.from(box.get('queries'));

    int filteredList =
        list.indexWhere((element) => element['queryId'] == queryId);
    var querydetail = QueryModel.fromMap(list[filteredList]);
    return querydetail;
  }

  List<Map<String, dynamic>> get queryList {
    try {
      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(box.get('queries'));
      return list;
    } catch (e) {
      return [];
    }
  }
}
