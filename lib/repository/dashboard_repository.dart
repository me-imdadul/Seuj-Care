import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:seujcare/models/dashboard_model.dart';

class DashboardRepository {
  Box box = Hive.box('myBox');

  DashboardModel adminDashboardData() {
    try {
      // List<Map<String, dynamic>> crops =
      //     List<Map<String, dynamic>>.from(box.get('crops', defaultValue: []));
      List<Map<String, dynamic>> users =
          List<Map<String, dynamic>>.from(box.get('users', defaultValue: []));
      List<Map<String, dynamic>> queries =
          List<Map<String, dynamic>>.from(box.get('queries', defaultValue: []));

      var farmers =
          users.where((element) => element['role'] == 'Farmer').toList();
      var experts =
          users.where((element) => element['role'] == 'Expert').toList();

      var issuesResolved =
          queries.where((element) => element['status'] == '1').toList();
      return DashboardModel(
          farmersCount: farmers.length,
          expertsCount: experts.length,
          issuesCount: queries.length,
          resolvedIssueCount: issuesResolved.length,
          createdIssueCount: 10);
    } catch (e) {
      log('Something went wrong in fetching dashboard data. $e');
      return DashboardModel(
          farmersCount: 0,
          expertsCount: 0,
          issuesCount: 0,
          resolvedIssueCount: 0,
          createdIssueCount: 0);
    }
  }

  DashboardModel setDashboardData(DashboardModel data) {
    return DashboardModel(
        farmersCount: data.farmersCount,
        expertsCount: data.expertsCount,
        issuesCount: data.issuesCount,
        resolvedIssueCount: data.resolvedIssueCount,
        createdIssueCount: data.createdIssueCount);
  }
}