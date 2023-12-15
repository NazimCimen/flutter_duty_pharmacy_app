import 'package:flutter/material.dart';
import 'package:pharmacy_app/utility/extensions/provider_extensions.dart';
import 'package:pharmacy_app/utility/extensions/size_extensions.dart';
import 'package:pharmacy_app/utility/functions.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return context.watchHomeDataLength() > 0
        ? Center(
            child: SizedBox(
                width: context.dynamicWidht(0.9),
                child: ListView.separated(
                  itemCount: context.watchHomeDataLength(),
                  itemBuilder: (context, index) => Padding(
                    padding: context.paddingAllLow,
                    child: SizedBox(
                        height: context.dynamicHeight(0.22),
                        width: context.dynamicWidht(0.9),
                        child: Padding(
                          padding: context.paddingMedium,
                          child: buildColumnPharmacy(context, index),
                        )),
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(color: Colors.black);
                  },
                )),
          )
        : SizedBox(
            height: context.dynamicHeight(0.22),
            width: context.dynamicWidht(0.9),
            child: Padding(
                padding: context.paddingMedium,
                child: buildTextNoPharmacy(context)));
  }


  Column buildColumnPharmacy(BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: FittedBox(child: buildTextPharmacyName(context, index)),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: FittedBox(child: buildRowPharmacyPhone(context, index)),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: buildAdressTextForDetails(context, index),
          ),
        )
      ],
    );
  }

  Text buildTextPharmacyName(BuildContext context, int index) {
    return Text(
      '${context.watchPharmacyName(index)}',
      style: TextStyle(
        fontSize: context.dynamicWidht(0.08),
        color: Colors.red,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Row buildRowPharmacyPhone(BuildContext context, int index) {
    return Row(
      children: [
        Icon(
          size: context.dynamicWidht(0.05),
          Icons.call,
          color: Colors.red,
        ),
        Text(
          style: TextStyle(
            fontSize: context.dynamicWidht(0.05),
            overflow: TextOverflow.ellipsis,
          ),
          ': ${context.watchPharmacyPhone(index)}',
        ),
      ],
    );
  }

  Text buildAdressTextForDetails(BuildContext context, int index) {
    return Text(context.watchPharmacyAdress(index),
        maxLines: 2,
        style: TextStyle(
          fontSize: context.dynamicHeight(0.02),
          overflow: TextOverflow.ellipsis,
        ));
  }
}
