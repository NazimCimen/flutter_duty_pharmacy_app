import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmacy_app/utility/constants.dart';
import 'package:pharmacy_app/feature/models/cities_model.dart';
import 'package:pharmacy_app/services/api_service.dart';
import 'package:pharmacy_app/utility/extensions/navigation_extensions.dart';
import 'package:pharmacy_app/utility/extensions/size_extensions.dart';
import 'package:pharmacy_app/utility/functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ApiService _service;
  late CitiesModel? _citiesModel;

  Future<void> getCities() async {
    late final List<dynamic> cities;
    if (box.read(boxKeyValueOfCitiesList) == null) {
      _citiesModel = await _service.getCities();
      cities = fromModelToList(_citiesModel!);
      await box.write(boxKeyValueOfCitiesList, cities);
      anasayfayagec(cities);
    } else {
      cities = box.read(boxKeyValueOfCitiesList);
      anasayfayagec(cities);
    }
  }

  void anasayfayagec(List<dynamic> cities) async {
    await Future.delayed(const Duration(seconds: 2));
    context.pushReplacementFilterLocationsView(cities);
  }

  @override
  void initState() {
    super.initState();
    _service = ApiService();
    _citiesModel = CitiesModel();
    getCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.dynamicHeight(0.4),
              width: context.dynamicWidht(0.6),
              child: FittedBox(
                child: buildImage(),
              ),
            ),
            SizedBox(
              height: context.dynamicHeight(0.2),
              width: context.dynamicWidht(0.6),
              child: FittedBox(
                child: buildRowLoading(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Image buildImage() {
    return Image.asset(logoAssetPath);
  }

  Row buildRowLoading(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          loadingTxt,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          width: context.dynamicHeight(0.01),
        ),
        SpinKitThreeBounce(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          size: 10,
        )
      ],
    );
  }
}
