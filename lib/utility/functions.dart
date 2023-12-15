import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/models/cities_model.dart';
import 'package:pharmacy_app/utility/constants.dart';
import 'package:pharmacy_app/utility/extensions/size_extensions.dart';


///this func converts Turkish characters to English
String formatLocationName(String input) {
  if (input == 'Kıbrıs KKTC') {
    return 'kibris';
  } else {
    Map<String, String> turkishCharacters = {
      'Ç': 'c',
      'ç': 'c',
      'Ğ': 'g',
      'ğ': 'g',
      'İ': 'i',
      'ı': 'i',
      'Ö': 'o',
      'ö': 'o',
      'Ü': 'u',
      'ü': 'u',
      'Ş': 's',
      'ş': 's',
      ' ': '-'
    };

    String result = '';

    for (int i = 0; i < input.length; i++) {
      String currentChar = input[i];

      if (turkishCharacters.containsKey(currentChar)) {
        result += turkishCharacters[currentChar]!;
      } else {
        result += currentChar;
      }
    }
    return result;
  }
}
///from model to list
List<String> fromModelToList(CitiesModel citiesModel) {
  List<String> cities = [];
  for (int i = 0; i < citiesModel.data!.length; i++) {
    cities.add(citiesModel.data![i].sehirAd!);
  }
  return cities;
}

///if there is no prharmacy where user choosed,this method works
Center buildTextNoPharmacy(BuildContext context) {
  return Center(
      child: SizedBox(
          width: context.dynamicWidht(1),
          height: context.dynamicHeight(0.2),
          child: FittedBox(child: Text(noPharmacyTxt))));
}
