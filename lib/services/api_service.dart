import 'package:dio/dio.dart';
import 'package:pharmacy_app/feature/models/cities_model.dart';
import 'package:pharmacy_app/feature/models/districts_model.dart';
import 'package:pharmacy_app/feature/models/pharmacy_model.dart';
import 'package:pharmacy_app/utility/extensions/api_extension.dart';
import 'package:pharmacy_app/utility/functions.dart';

abstract class IApiService {
  Future<PharmacyModel?> getDutyPharmacyForCityForDistrict(
      {required String? city, required String? district});
  Future<CitiesModel?> getCities();
  Future<DistrictModel?> getDistricts(String city);
}

class ApiService implements IApiService {
  final Dio _networkManager =
      Dio(BaseOptions(baseUrl: '${ApiServiceConts.baseUrl.value}'));
  PharmacyModel _pharmacyModel = PharmacyModel();
  CitiesModel _citiesModel = CitiesModel();
  DistrictModel _districtsModel = DistrictModel();

  @override
  Future<PharmacyModel?> getDutyPharmacyForCityForDistrict(
      {required String? city, required String? district}) async {
    try {
      final response = await _networkManager.get(
        ApiServiceConts.pharmacy.name,
        queryParameters: {
          ApiServiceConts.city.name: city,
          ApiServiceConts.county.name: district
        },
        options: Options(
          headers: {
            ApiServiceConts.contentTypeName.name:
                ApiServiceConts.contentType.value,
            ApiServiceConts.authorization.name:
                ApiServiceConts.authorizationToken.value,
          },
        ),
      );

      if (response.statusCode == 200) {
        if (response.data is Map) {
          _pharmacyModel = PharmacyModel.fromJson(response.data);
          return _pharmacyModel;
        }
        print(response.data);
      } else {
        showErrorToastAndExit(
            'Bir sorun oluştu!\nLütfen daha sonra tekrar deneyin..');
      }
    } catch (e) {
      showErrorToastAndExit(
          'Bir sorun oluştu!\nLütfen daha sonra tekrar deneyin..');
    }
    return null;
  }

  @override
  Future<CitiesModel?> getCities() async {
    try {
      final response = await _networkManager.get(
        '${ApiServiceConts.pharmacy.name}/${ApiServiceConts.city.name}',
        queryParameters: {
          ApiServiceConts.apikey.name: ApiServiceConts.apikey.value,
        },
      );

      if (response.statusCode == 200) {
        if (response.data is Map) {
          _citiesModel = CitiesModel.fromJson(response.data);
          return _citiesModel;
        }
        print(response.data);
      } else {
        showErrorToastAndExit(
            'Bir sorun oluştu!\nLütfen daha sonra tekrar deneyin..');
      }
    } catch (e) {
      showErrorToastAndExit(
          'Bir sorun oluştu!\nLütfen daha sonra tekrar deneyin..');
    }
    return null;
  }

  @override
  Future<DistrictModel?> getDistricts(String city) async {
    try {
      final response = await _networkManager.get(
        ApiServiceConts.pharmacy.name + '/' + ApiServiceConts.city.name,
        queryParameters: {ApiServiceConts.city.name: '$city'},
        options: Options(
          headers: {
            ApiServiceConts.authorization.name:
                ApiServiceConts.authorizationToken.value,
            ApiServiceConts.contentType.name: ApiServiceConts.contentType.value,
          },
        ),
      );

      if (response.statusCode == 200) {
        if (response.data is Map) {
          _districtsModel = DistrictModel.fromJson(response.data);
          return _districtsModel;
        }
        print(response.data);
      } else {
        showErrorToastAndExit(
            'Bir sorun oluştu!\nLütfen daha sonra tekrar deneyin..');
      }
    } catch (e) {
      showErrorToastAndExit(
          'Bir sorun oluştu!\nLütfen daha sonra tekrar deneyin..');
    }
    return null;
  }
}
