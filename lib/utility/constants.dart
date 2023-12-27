import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

///STRINGS
String loadingTxt = 'Lütfen Bekleyiniz';
String chooseCityDistrictTxt = 'Lütfen şehir ve ilçe bilgisini giriniz';
String findTxt = 'BUL';
String titleStringTxt = 'N Ö B E T Ç İ  E C Z A N E L E R';
String goToMapTxt = 'Detaylar ve adres bilgisi için tıklayınız...';
String adressTxt = 'adres : ';
String telTxt = 'tel';
String noPharmacyTxt = 'Seçtiğiniz bölgede bir nöbetçi eczane bulunmamaktadır.';
String chooseCityTxt = 'Bir Şehir Seçin';
String chooseDistrictTxt = 'Bir İlçe Seçin';
String connectionError =
    'Bağlantı sorunu.İnternet bağlantınızı kontrol edin ve Uygulamayı yeniden başlatın';

///ASSET PATHS
String imageAssetPath = 'assets/images/pharmacyLocation.png';
String logoAssetPath = 'assets/images/applogo.png';

///COLORS
Color myTextColorRed = Color(0xffdd051d);
Color appBackgColorLight = Color(0xffFFF3E2);
Color appBackColorDark = Color(0xff272829);
Color appContColorLight = Color(0xffFCFFE7);
Color appContColorDark = Color(0xff1A120B);

///GET STORAGE AND KEY VALUE
final box = GetStorage();
const String boxKeyValueOfCitiesList = 'cities';
const String boxKeyValueOfCity = 'city';
const String boxKeyValueOfDistrict = 'district';

///TEXT EDITING CONTROLLERS
TextEditingController popUpDistrict = TextEditingController();
TextEditingController popUpCity = TextEditingController();

///Box Shadow Lists
List<BoxShadow> boxShadowHomeContainer = [
  const BoxShadow(
    blurStyle: BlurStyle.normal,
    color: Colors.red,
    offset: Offset(0, 5),
    blurRadius: 5.0,
    spreadRadius: 0,
  )
];
List<BoxShadow> boxShadowDetailsPageContainer = [
  const BoxShadow(
    color: Colors.grey,
    offset: Offset(0, 5),
    blurRadius: 5.0,
    spreadRadius: 0,
  ),
];
