import 'package:flutter/material.dart';
import 'package:seujcare/models/crop_model.dart';
import 'package:seujcare/models/dashboard_model.dart';
import 'package:seujcare/models/expert_model.dart';
import 'package:seujcare/repository/crop_repository.dart';
import 'package:seujcare/repository/dashboard_repository.dart';
import 'package:seujcare/repository/expert_repository.dart';
import 'package:seujcare/services/auth_service.dart';

class AdminProvider with ChangeNotifier {
  final _dashboardRepository = DashboardRepository();
  final _expertrepository = ExpertRepository();
  final _cropRepository = CropRepository();

  late DashboardModel _data;
  late List<ExpertModel> _experts;
  late List<CropModel> _crops;

  DashboardModel get data => _data;
  List<ExpertModel> get experts => _experts;
  List<CropModel> get crops => _crops;

  void setDashboardData(DashboardModel dashboard) {
    _data = _dashboardRepository.setDashboardData(dashboard);
    notifyListeners();
  }

// expert list
  void expertList() {
    _experts = _expertrepository.allexperts;
    notifyListeners();
  }

  void addCropData(CropModel crop) {
    _cropRepository.addCropDetails(crop);
    notifyListeners();
  }

  void getCropList() async {
    _crops = await _cropRepository.getCrops();
  }
}
