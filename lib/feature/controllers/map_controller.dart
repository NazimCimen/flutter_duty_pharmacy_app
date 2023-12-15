import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends ChangeNotifier {
  GoogleMapController? mapController;
  bool isPharmacyCardSelected = true;
  bool isMapCreated = false;

  Future<void> animateMap(double lat, double lon) async {
    await mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lon), zoom: 15),
      ),
    );
    notifyListeners();
  }

  void clickMarker() {
    isPharmacyCardSelected = !isPharmacyCardSelected;
    notifyListeners();
  }

  void mapCreated() {
    isMapCreated = true;
    notifyListeners();
  }
}
