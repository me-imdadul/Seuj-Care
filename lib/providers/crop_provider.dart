import 'package:flutter/material.dart';
import 'package:seujcare/models/crop_disease_model.dart';
import 'package:seujcare/models/crop_model.dart';
import 'package:seujcare/models/season_model.dart';
import 'package:seujcare/repository/crop_disease_repository.dart';
import 'package:seujcare/repository/crop_repository.dart';
import 'package:seujcare/repository/season_repository.dart';

class CropProvider with ChangeNotifier {
  final _cropRepository = CropRepository();
  final _cropDiseaseRepository = CropDiseaseRepository();
  final _seasonRepository = SeasonRepository();

  List<CropModel> _crops = [];
  List<CropDiseaseModel> _cropDiseases = [];
  List<SeasonModel> _seasons = [];

  List<CropModel> get crops {
    _crops = _cropRepository.cropList;
    return _crops;
  }

  List<SeasonModel> get seasons {
    _seasons = _seasonRepository.allSeasons;
    return _seasons;
  }

  List<CropDiseaseModel> get cropDiseases {
    _cropDiseases = _cropDiseaseRepository.cropDiseases;
    return _cropDiseases;
  }

  //crop

  Future<String?> addCrop(CropModel crop) async {
    var result = await _cropRepository.addCrop(crop);
    if (result == null) {
      notifyListeners();
    }
    return result;
  }

  Future<String?> deleteCrop(int index) async {
    var result = await _cropRepository.deleteCrop(index);
    if (result == null) {
      notifyListeners();
    }
    return result;
  }

  Future<String?> updateCrop(int index, CropModel crop) async {
    var result = await _cropRepository.updateCrop(index, crop);
    if (result == null) {
      notifyListeners();
    }
    return result;
  }

  // disease

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

  // seasons
  Future<String?> addSeason(SeasonModel season) async {
    var result = await _seasonRepository.insertSeason(season);
    if (result == null) {
      notifyListeners();
    }
    return result;
  }

  Future<String?> deleteSeason(int index) async {
    var result = await _seasonRepository.deleteSeason(index);
    if (result == null) {
      notifyListeners();
    }
    return result;
  }
}
