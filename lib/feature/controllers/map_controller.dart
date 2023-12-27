import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends ChangeNotifier {
  GoogleMapController? mapController;
  bool isMapCreated = false;
  bool mapCantCreate = false;

///kullanıcı listeden bir eczane seçtiği zaman haritayı ilgili konuma yönlendirir
  Future<void> animateMap(double lat, double lon) async {
    await mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lon), zoom: 15),
      ),
    );
    notifyListeners();
  }


///haritanın oluşturulup oluşturulduysa isMapCreated ı true yapar
  void mapCreated() {
    isMapCreated = true;
    notifyListeners();
  }

///eğer 5 saniye içinde harita oluşturulamaz ise mapCantCreate ı true yapar
  Future<void> waitAndCheckMapController() async {
    await Future.delayed(Duration(seconds: 5)); 
    if (mapController == null) {
      mapCantCreate = true;
      notifyListeners();
    }
  }
}
