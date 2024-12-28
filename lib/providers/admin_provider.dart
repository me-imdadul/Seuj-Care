import 'package:flutter/material.dart';
import 'package:seujcare/models/crop_disease_model.dart';
import 'package:seujcare/models/dashboard_model.dart';
import 'package:seujcare/models/expert_model.dart';
import 'package:seujcare/repository/crop_repository.dart';
import 'package:seujcare/repository/dashboard_repository.dart';
import 'package:seujcare/repository/expert_repository.dart';

class AdminProvider with ChangeNotifier {
  final _dashboardRepository = DashboardRepository();
  final _expertrepository = ExpertRepository();
  final _cropDiseaseRepository = CropDiseaseRepository();

  List<ExpertModel> _experts = [];
  List<CropDiseaseModel> _crops = [];

  DashboardModel get data {
    return _dashboardRepository.adminDashboardData();
  }

  List<ExpertModel> get experts {
    _experts = _expertrepository.allexperts;
    return _experts;
  }

  List<CropDiseaseModel> get cropDiseases {
    _crops = _cropDiseaseRepository.getCrops();
    return _crops;
  }

  Future<String?> addCropDiseaseCategory(CropDiseaseModel cropDisease) async {
    String? response = await _cropDiseaseRepository.addCropDisease(cropDisease);
    if (response == null) {
      notifyListeners();
    }
    return response;
  }

  Future<String?> deletecropDiseaseCategory(int index) async {
    String? response = await _cropDiseaseRepository.deleteCropDisease(index);
    if (response == null) {
      notifyListeners();
    }
    return response;
  }
}
