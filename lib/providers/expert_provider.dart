import 'package:flutter/material.dart';
import 'package:seujcare/models/query_model.dart';
import 'package:seujcare/repository/query_repository.dart';

class ExpertProvider with ChangeNotifier {
  final _queryRepository = QueryRepository();

  List<QueryModel> _queries = [];

  List<QueryModel> get assigned => _queries;

  int get completed {
    return assigned.where((element) => element.status == '1').toList().length;
  }

  assignedQueries(String userId) async {
    _queries = await _queryRepository.getAssignedQuery(userId);
  }
}
