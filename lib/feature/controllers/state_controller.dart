import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/models/districts_model.dart';
import 'package:pharmacy_app/feature/models/pharmacy_model.dart';
import 'package:pharmacy_app/services/api_service.dart';

class StateController extends ChangeNotifier {
  List<String> filteredCities = [];
  List<String> districts = [];
  ApiService _service = ApiService();
  DistrictModel? districtsModel = DistrictModel();
  PharmacyModel? datasOfHome;
  bool loadingDatas = false;

  ///ilçeler için kullanıcıdan alınan il parametresine göre apiye istek atar
  Future<void> fetchDistricts(String city) async {
    loadingDatas = true;
    notifyListeners();
    districts.clear();
    districtsModel = await _service.getDistricts(city);
    for (int i = 0; i < districtsModel!.data!.length; i++) {
      districts.add(districtsModel!.data![i].ilceAd!);
    }
    await Future.delayed(Duration(milliseconds: 500));
    loadingDatas = false;
    notifyListeners();
  }

  ///kullanıcıdan alınan il ve ilçe bilgilerine göre apiye istek atar
  Future<void> fetchAndSendDatasToHome(
      {required String city, required String district}) async {
    loadingDatas = true;
    notifyListeners();
    datasOfHome = await _service.getDutyPharmacyForCityForDistrict(
        city: city, district: district);
    await Future.delayed(Duration(milliseconds: 500));
    loadingDatas = false;
    notifyListeners();
  }
}
