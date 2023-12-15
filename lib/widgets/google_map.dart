import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharmacy_app/feature/controllers/map_controller.dart';
import 'package:pharmacy_app/feature/controllers/state_controller.dart';
import 'package:pharmacy_app/utility/constants.dart';
import 'package:pharmacy_app/utility/extensions/provider_extensions.dart';
import 'package:provider/provider.dart';

class BuildGoogleMap extends StatefulWidget {
  const BuildGoogleMap({
    super.key,
  });

  @override
  State<BuildGoogleMap> createState() => _BuildGoogleMapState();
}

class _BuildGoogleMapState extends State<BuildGoogleMap> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CameraPosition _pharmacyPosition;
    if (context.watchPharmacyLatitude(
                context.watch<StateController>().focusedPharmacyCard) ==
            0 &&
        context.watchPharmacyLongitude(
                context.watch<StateController>().focusedPharmacyCard) ==
            0) {
      _pharmacyPosition = CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(39.9334, 32.8597),
          tilt: 59.440717697143555,
          zoom: 40.151926040649414);
    } else {
      _pharmacyPosition = CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(
              //buarada crash yiyebilirsin
              context.watchPharmacyLatitude(
                  context.watch<StateController>().focusedPharmacyCard),
              context.watchPharmacyLongitude(
                  context.watch<StateController>().focusedPharmacyCard)),
          tilt: 59.440717697143555,
          zoom: 15.151926040649414);
    }

    return Stack(
      children: [
         context.watch<MapController>().isMapCreated!=true?
             Center(
              child: CircularProgressIndicator(),
            ):SizedBox(),
        GoogleMap(
          onMapCreated: (controller) {
            Provider.of<MapController>(context, listen: false).mapController =
                controller;
            context.read<MapController>().mapCreated();
          },
          initialCameraPosition: _pharmacyPosition,
          mapType: MapType.normal,
          markers: _createMarkers(_pharmacyPosition, context),
        ),
      ],
    );
  }

  Set<Marker> _createMarkers(
      CameraPosition cameraPosition, BuildContext context) {
    return context
        .watch<StateController>()
        .datasOfHome!
        .data!
        .map((e) => Marker(
              markerId: MarkerId(e.hashCode.toString()),
              position: LatLng(e.latitude!, e.longitude!),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
              infoWindow: InfoWindow(title: e.eczaneAdi),
              onTap: () {},
            ))
        .toSet();
  }
}
