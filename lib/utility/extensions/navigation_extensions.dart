import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/views/filter_location_screen_view.dart';
import 'package:pharmacy_app/feature/views/ui_view.dart';

extension ContextExtensions on BuildContext {
  void pushReplacementFilterLocationsView(List<dynamic> cities) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(
        builder: (context) {
          return FilterLocationsView(
            cities: cities,
          );
        },
      ),
    );
  }
  

  void pushReplacementToView() {
    Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => const Ui()));
  }
}
