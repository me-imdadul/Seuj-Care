import 'package:hive/hive.dart';
import 'package:seujcare/models/query_model.dart';

class QueryRepository {
  Box box = Hive.box('myBox');

  Future<String?> createNewQuery(QueryModel query) async {
    try {
      List<Map<dynamic, dynamic>> list = List<Map<dynamic, dynamic>>.from(
          box.get('queries', defaultValue: []));
      list.add(query.toMap());
      await box.put('queries', list);
      return null;
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }

  Future<String?> updateQuery(String queryId, QueryModel query) async {
    try {
      List<Map<dynamic, dynamic>> list = List<Map<dynamic, dynamic>>.from(
          box.get('queries', defaultValue: []));

      int index = list.indexWhere((element) => element['queryId'] == queryId);

      list[index] = query.toMap();

      await box.put('queries', list);
      return null;
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }

  Future<String?> deleteQuery(String id) async {
    try {
      List<Map<dynamic, dynamic>> list = box.get('queries', defaultValue: [])!;
      list.removeWhere((f) => f['queryId'] == id);
      await box.put('queries', list);
      return null;
    } catch (e) {
      return 'Something went wrong. $e';
    }
  }

  Future<QueryModel> getQueryDetails(String queryId) async {
    List<Map<dynamic, dynamic>> list =
        List<Map<dynamic, dynamic>>.from(box.get('queries', defaultValue: []));

    int filteredList =
        list.indexWhere((element) => element['queryId'] == queryId);
    var querydetail = QueryModel.fromMap(list[filteredList]);
    return querydetail;
  }

  Future<List<QueryModel>> getAssignedQuery(String userId) async {
    List<Map<dynamic, dynamic>> list =
        List<Map<dynamic, dynamic>>.from(box.get('queries', defaultValue: []));

    var filteredList = list.where((element) => element['assignedTo'] == userId);
    var querydetail = filteredList.map((e) => QueryModel.fromMap(e)).toList();
    return querydetail;
  }

  Future<List<QueryModel>> getCompletedQuery(String status) async {
    List<Map<dynamic, dynamic>> list =
        List<Map<dynamic, dynamic>>.from(box.get('queries', defaultValue: []));

    var filteredList = list.where((element) => element['status'] == status);
    var querydetail = filteredList.map((e) => QueryModel.fromMap(e)).toList();
    return querydetail;
  }

  List<QueryModel> get queryList {
    try {
      List<Map<dynamic, dynamic>> list = List<Map<dynamic, dynamic>>.from(
          box.get('queries', defaultValue: []));

      var result = list.map((e) => QueryModel.fromMap(e)).toList();

      return result;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
