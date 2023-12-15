import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/controllers/state_controller.dart';
import 'package:pharmacy_app/utility/constants.dart';
import 'package:pharmacy_app/utility/functions.dart';
import 'package:provider/provider.dart';

extension ProviderExtensions on BuildContext {
  int watchHomeDataLength() {
    return this.watch<StateController>().datasOfHome?.data?.length ?? 0;
  }

  String watchPharmacyName(int index) {
    final homeData = this.watch<StateController>().datasOfHome;
    final pharmacyData = homeData?.data?[index];

    return pharmacyData?.eczaneAdi ?? '';
  }

  String watchPharmacyAdress(int index) {
    final homeData = this.watch<StateController>().datasOfHome;
    final pharmacyData = homeData?.data?[index];

    return pharmacyData?.adresi ?? '';
  }

  String watchPharmacyPhone(int index) {
    final homeData = this.watch<StateController>().datasOfHome;
    final pharmacyData = homeData?.data?[index];

    return pharmacyData?.telefon ?? '';
  }

  double watchPharmacyLatitude(int index) {
    final homeData = this.watch<StateController>().datasOfHome;

    if (homeData?.data?[index] != null) {
      final pharmacyData = homeData?.data?[index];
      return pharmacyData?.latitude ?? 0;
    } else {
      return 0;
    }
  }

  double watchPharmacyLongitude(int index) {
    final homeData = this.watch<StateController>().datasOfHome;
    if (homeData?.data?[index] != null) {
      final pharmacyData = homeData?.data?[index];
      return pharmacyData?.longitude ?? 0;
    } else {
      return 0;
    }
  }

  List<String> watchDistricts() {
    return this.watch<StateController>().districts;
  }

  Future<void> readDistricts(String city) {
    
    return this.read<StateController>().fetchDistricts(city);
  }

  Future<void> readToSendDataOfHome() {
    return this.read<StateController>().fetchAndSendDatasToHome(
        city: formatLocationName(popUpCity.text),
        district: formatLocationName(popUpDistrict.text));
  }
}
