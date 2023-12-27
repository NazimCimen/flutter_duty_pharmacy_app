import 'package:flutter/material.dart';
import 'package:pharmacy_app/utility/constants.dart';
import 'package:pharmacy_app/utility/extensions/provider_extensions.dart';
import 'package:pharmacy_app/utility/extensions/size_extensions.dart';
import 'package:pharmacy_app/utility/extensions/style_extensions.dart';
import 'package:pharmacy_app/utility/functions.dart';

class SelectionCityOrDistrict extends StatefulWidget {
  List placeList;
  int cityOrDistrict;
  SelectionCityOrDistrict(
      {super.key, required this.placeList, required this.cityOrDistrict});

  @override
  State<SelectionCityOrDistrict> createState() =>
      _SelectionCityOrDistrictState();
}

class _SelectionCityOrDistrictState extends State<SelectionCityOrDistrict> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          widget.cityOrDistrict == 1 && popUpCity.text == ''
              ? buildTextFilterPage(context,  popUpCity.text)
              : widget.cityOrDistrict == 1 && popUpCity.text != ''
                  ? buildTextFilterPage(context, popUpCity.text)
                  : widget.cityOrDistrict == 2 && popUpDistrict.text == ''
                      ? buildTextFilterPage(context, popUpDistrict.text)
                      : buildTextFilterPage(context, popUpDistrict.text),
          FittedBox(child: buildPopUpForChoosing(context)),
        ],
      ),
    );
  }

  ///this method shows text on choosing section
  Text buildTextFilterPage(BuildContext context, String text) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        style: context.customTitleLargeTextStyle);
  }

  ///this method shows cities or districts popup menu according to conditions
  PopupMenuButton<Object> buildPopUpForChoosing(BuildContext context) {
    return PopupMenuButton(
      enabled: true,
      icon: FittedBox(child: const Icon(Icons.arrow_drop_down)),
      iconSize: context.dynamicWidht(0.1),
      itemBuilder: (context) {
        return widget.placeList.map((value) {
          return PopupMenuItem(
            value: value,
            onTap: () async {
              if (widget.cityOrDistrict == 1) {
                setState(() {
                  popUpCity.text = value;
                });
                await context.readDistricts(formatLocationName(value));
              } else {
                setState(() {
                  popUpDistrict.text = value;
                });
              }
            },
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        }).toList();
      },
    );
  }
}
