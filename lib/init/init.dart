import 'package:get_storage/get_storage.dart';
import 'package:pharmacy_app/utility/constants.dart';

Future<void> initializeApp() async {
  await GetStorage.init();
  popUpCity.text =  box.read(boxKeyValueOfCity) ?? chooseCityTxt;
  popUpDistrict.text =  box.read(boxKeyValueOfDistrict) ?? chooseDistrictTxt;
  
}
