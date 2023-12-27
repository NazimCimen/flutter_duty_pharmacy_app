import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharmacy_app/feature/controllers/map_controller.dart';
import 'package:pharmacy_app/feature/controllers/state_controller.dart';
import 'package:pharmacy_app/utility/constants.dart';
import 'package:pharmacy_app/utility/extensions/provider_extensions.dart';
import 'package:pharmacy_app/utility/extensions/size_extensions.dart';
import 'package:pharmacy_app/utility/functions.dart';
import 'package:provider/provider.dart';

class MapScreenView extends StatefulWidget {
  const MapScreenView({super.key});

  @override
  State<MapScreenView> createState() => _MapScreenViewState();
}

class _MapScreenViewState extends State<MapScreenView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        //nöbetçi eczane var ise haritayı build et.yok  ise ilgili mesajı ekranda göster
        context.watchHomeDataLength() > 0
            ? const BuildGoogleMap()
            : buildTextNoPharmacyOrConnection(context, noPharmacyTxt),
        //web ve mobil için nobetçi eczaneleri listeleyen listviewlar
        Align(
          alignment: Alignment.topLeft,
          child: size.width > 500
              ? SizedBox(
                  height: context.dynamicHeight(1),
                  width: context.dynamicWidht(0.2),
                  child: const PharmaciesListViewOnMap(
                    axis: Axis.vertical,
                  ),
                )
              : SizedBox(
                  height: context.dynamicHeight(0.2),
                  child: const PharmaciesListViewOnMap(
                    axis: Axis.horizontal,
                  ),
                ),
        )
      ],
    );
  }
}

class PharmaciesListViewOnMap extends StatelessWidget {
  final Axis axis;
  const PharmaciesListViewOnMap({super.key, required this.axis});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: axis,
        itemCount: context.watchHomeDataLength(),
        itemBuilder: (context, index) => SizedBox(
              width: context.dynamicWidht(0.6),
              child: Card(
                child: ListTile(
                  title: Text(
                    maxLines: 2,
                    context.watchPharmacyName(index) + '\n',
                  ),
                  subtitle: Text(
                    context.watchPharmacyAdress(index),
                    maxLines: 3,
                  ),
                  onTap: () async {
                    //harita yüklenmiş ise seçilen konuma haritayı yönlendir.
                    if (Provider.of<MapController>(context, listen: false)
                            .mapController !=
                        null) {
                      await context.read<MapController>().animateMap(
                          Provider.of<StateController>(context, listen: false)
                              .datasOfHome!
                              .data![index]
                              .latitude!,
                          Provider.of<StateController>(context, listen: false)
                              .datasOfHome!
                              .data![index]
                              .longitude!);
                    }
                  },
                ),
              ),
            ));
  }
}

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
    context.read<MapController>().waitAndCheckMapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CameraPosition _pharmacyPosition;
    _pharmacyPosition = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(context.watchPharmacyLatitude(0),
            context.watchPharmacyLongitude(0)),
        tilt: 59.440717697143555,
        zoom: 15.151926040649414);
    return Stack(
      children: [
        ///harita oluşturulana kadar circular progress indicator
        context.watch<MapController>().isMapCreated == false
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox(),

        ///harite 5 saniye içinde oluşturulmazsa bağlantı sorunu hata mesajı
        context.watch<MapController>().mapCantCreate == true
            ? buildTextNoPharmacyOrConnection(context, connectionError)
            : SizedBox(),

        ///harita
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

  ///api da gelen ve kullanıcının filtresinden geçen eczanelerin konumlarına ait Markerlar
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
