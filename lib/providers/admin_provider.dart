import 'package:flutter/material.dart';

import 'package:seujcare/models/dashboard_model.dart';
import 'package:seujcare/models/expert_model.dart';

import 'package:seujcare/repository/dashboard_repository.dart';
import 'package:seujcare/repository/expert_repository.dart';

class AdminProvider with ChangeNotifier {
  final _dashboardRepository = DashboardRepository();
  final _expertrepository = ExpertRepository();

  List<ExpertModel> _experts = [];

  DashboardModel get data {
    return _dashboardRepository.adminDashboardData();
  }

  List<ExpertModel> get experts {
    _experts = _expertrepository.allexperts;
    return _experts;
  }
}
