import 'package:flutter/material.dart';
import 'package:seujcare/models/query_model.dart';
import 'package:seujcare/repository/query_repository.dart';

class QueryProvider with ChangeNotifier {
  final _queryRepository = QueryRepository();

  List<QueryModel> _queries = [];

  Future<String?> newQuery(QueryModel query) async {
    var result = await _queryRepository.createNewQuery(query);
    if (result == null) {
      notifyListeners();
    }
    return result;
  }

  Future<QueryModel> queryDetail(String queryId) async {
    var result = await _queryRepository.getQueryDetails(queryId);
    return result;
  }

  Future<String?> deleteQuery(String queryId) async {
    var result = await _queryRepository.deleteQuery(queryId);
    if (result == null) {
      notifyListeners();
    }
    return result;
  }

  Future<String?> updateQuery(String queryId, QueryModel query) async {
    var result = await _queryRepository.updateQuery(queryId, query);
    if (result == null) {
      notifyListeners();
    }
    return result;
  }

  List<QueryModel> get queries {
    _queries = _queryRepository.queryList;
    return _queries;
  }
}
