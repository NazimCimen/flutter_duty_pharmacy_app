import 'package:flutter/material.dart';
import 'package:pharmacy_app/feature/controllers/map_controller.dart';
import 'package:pharmacy_app/feature/controllers/state_controller.dart';
import 'package:pharmacy_app/utility/extensions/provider_extensions.dart';
import 'package:pharmacy_app/utility/extensions/size_extensions.dart';
import 'package:pharmacy_app/utility/functions.dart';
import 'package:pharmacy_app/widgets/google_map.dart';
import 'package:provider/provider.dart';

class MapScreenView extends StatelessWidget {
  const MapScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        context.watchHomeDataLength() > 0
            ? const BuildGoogleMap()
            : buildTextNoPharmacy(context),
        Align(
          alignment: Alignment.topLeft,
          child: size.width > 500
              ? SizedBox(
                  height: context.dynamicHeight(1),
                  width: context.dynamicWidht(0.2),
                  child: Visibility(
                      visible:
                          context.watch<MapController>().isPharmacyCardSelected,
                      child: const PharmaciesListViewOnMap(
                        axis: Axis.vertical,
                      )),
                )
              : SizedBox(
                  height: context.dynamicHeight(0.2),
                  child: Visibility(
                      visible:
                          context.watch<MapController>().isPharmacyCardSelected,
                      child: const PharmaciesListViewOnMap(
                        axis: Axis.horizontal,
                      )),
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
              //    height: context.dynamicHeight(0.2),
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
                    //haritanın tamamen yüklenip controllerın içinin dolu olduğundan emin ol
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
                    } else {
                      while (context.watch<MapController>().mapController ==
                          null) {
                        //timer oluştur belli bir süre içinde controllerın içi dolmaz ise while dan çık harita yüklenemedi mesajı oluştur.
                      }
                      context.read<MapController>().animateMap(
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
