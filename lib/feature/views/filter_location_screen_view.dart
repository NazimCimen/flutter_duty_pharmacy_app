import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmacy_app/feature/controllers/state_controller.dart';
import 'package:pharmacy_app/utility/constants.dart';
import 'package:pharmacy_app/utility/extensions/provider_extensions.dart';
import 'package:pharmacy_app/utility/extensions/size_extensions.dart';
import 'package:pharmacy_app/utility/extensions/style_extensions.dart';
import 'package:pharmacy_app/widgets/selection_container.dart';
import 'package:pharmacy_app/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

class FilterLocationsView extends StatelessWidget {
  final List<dynamic> cities;
  const FilterLocationsView({super.key, required this.cities});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //kullanıcıya şehir ve ilçe seçmesi için mesaj
              SizedBox(
                  height: context.dynamicHeight(0.1),
                  width: context.dynamicWidht(0.9),
                  child: Center(
                    child: FittedBox(
                      child: Text(chooseCityDistrictTxt,
                          style: context.customTitleLargeTextStyle.copyWith(fontSize: context.dynamicWidht(0.08))),
                    ),
                  )),
                 //şehir seçimi 
              SizedBox(
                  height: context.dynamicHeight(0.1),
                  width: context.dynamicWidht(0.8),
                  child: FittedBox(
                    child: SelectionCityOrDistrict(
                      placeList: cities,
                      cityOrDistrict: 1,
                    ),
                  )),
                  //ilçe seçimi
              SizedBox(
                  height: context.dynamicHeight(0.1),
                  width: context.dynamicWidht(0.8),
                  child: FittedBox(
                    child: SelectionCityOrDistrict(
                      placeList: context.watchDistricts(),
                      cityOrDistrict: 2,
                    ),
                  )),
              context.verticalSizedBox(0.02),
              //kullanıcıdan alınan bilgilere göre apiye istek atan ve diğer sayfaya götüren buton
              SizedBox(
                  height: context.dynamicHeight(0.055),
                  width: context.dynamicWidht(0.6),
                  child: MyCustomElevatedButton(
                    buttonText: findTxt,
                  )),
             context.verticalSizedBox(0.03),
             //veri çekme işlemleri sırasında ekranda gösterilecek loading spinkit
            SizedBox(
                  height: context.dynamicHeight(0.04),
                  width: context.dynamicWidht(0.3),
                  child: context.watch<StateController>().loadingDatas == true
                      ? const FittedBox(
                          child: SpinKitThreeBounce(
                            color:Colors.red
                          ),
                        )
                      : const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
