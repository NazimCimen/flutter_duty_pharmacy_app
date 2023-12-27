import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/views/map_screen_view.dart';
import 'package:pharmacy_app/utility/constants.dart';
import 'package:pharmacy_app/feature/views/filter_location_screen_view.dart';
import 'package:pharmacy_app/feature/views/home_screen_view.dart';
import 'package:pharmacy_app/widgets/custom_bottom_app_bar.dart';

class Ui extends StatelessWidget {
  const Ui({super.key});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> cities = box.read(boxKeyValueOfCitiesList);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: FittedBox(child: Text(titleStringTxt)),
        ),
        bottomNavigationBar: MyCustomBottomAppBar(),
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const HomeView(),
              MapScreenView(),
              FilterLocationsView(
                cities: cities,
              ),
            ]),
      ),
    );
  }
}
