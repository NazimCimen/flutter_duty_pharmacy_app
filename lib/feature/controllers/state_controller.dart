import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/models/districts_model.dart';
import 'package:pharmacy_app/feature/models/pharmacy_model.dart';
import 'package:pharmacy_app/services/api_service.dart';
import 'package:pharmacy_app/utility/constants.dart';

class StateController extends ChangeNotifier {

  TextEditingController filteredCitiesController = TextEditingController();
  TextEditingController filteredDistrictsController = TextEditingController();
  List<String> filteredCities = [];
  List<String> districts = [];
  ApiService _service = ApiService();
  DistrictModel? districtsModel = DistrictModel();
  PharmacyModel? datasOfHome;
  int focusedPharmacyCard = 0;
  bool loadingDatas = false;

  void changeFocusedPharmacyCard(int index) {
    focusedPharmacyCard = index;
    notifyListeners();
  }

  void fetchController(String city) {
    filteredCitiesController.text = city;
    notifyListeners();
  }

  void filterCities(String query, List<String> cities) {
    query = query.toLowerCase();
    filteredCities =
        cities.where((city) => city.toLowerCase().startsWith(query)).toList();
    notifyListeners();
  }

  Future<void> fetchDistricts(String city) async {
    loadingDatas = true;
    districts.clear();
    districtsModel = await _service.getDistricts(city);
    for (int i = 0; i < districtsModel!.data!.length; i++) {
      districts.add(districtsModel!.data![i].ilceAd!);
    }
    loadingDatas = false;
    notifyListeners();
  }

  Future<void> fetchAndSendDatasToHome(
      {required String city, required String district}) async {
    loadingDatas = true;
    datasOfHome = await _service.getDutyPharmacyForCityForDistrict(
        city: city, district: district);
    loadingDatas = false;
    notifyListeners();
  }
}
