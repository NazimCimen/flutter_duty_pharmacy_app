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

class FilterLocationsView extends StatefulWidget {
  final List<dynamic> cities;
  const FilterLocationsView({super.key, required this.cities});

  @override
  State<FilterLocationsView> createState() => _FilterLocationsViewState();
}

class _FilterLocationsViewState extends State<FilterLocationsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: context.dynamicHeight(0.1),
                  width: context.dynamicWidht(0.9),
                  child: Center(
                    child: FittedBox(
                      child: Text(chooseCityDistrictTxt,
                          style: context.customTitleLargeTextStyle.copyWith(fontSize: context.dynamicWidht(0.08))),
                    ),
                  )),
              SizedBox(
                  height: context.dynamicHeight(0.1),
                  width: context.dynamicWidht(0.8),
                  child: FittedBox(
                    child: SelectionCityOrDistrict(
                      placeList: widget.cities,
                      cityOrDistrict: 1,
                    ),
                  )),
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
              SizedBox(
                  height: context.dynamicHeight(0.055),
                  width: context.dynamicWidht(0.6),
                  child: MyCustomElevatedButton(
                    buttonText: findTxt,
                  )),
             context.verticalSizedBox(0.03),
            SizedBox(
                  height: context.dynamicHeight(0.04),
                  width: context.dynamicWidht(0.3),
                  child: context.watch<StateController>().loadingDatas == true
                      ? FittedBox(
                          child: SpinKitThreeBounce(
                            color:Theme.of(context).brightness==Brightness.light? Colors.black:Colors.white,
                          ),
                        )
                      : SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
