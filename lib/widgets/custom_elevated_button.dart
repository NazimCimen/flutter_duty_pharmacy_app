import 'package:flutter/material.dart';
import 'package:pharmacy_app/utility/constants.dart';
import 'package:pharmacy_app/utility/extensions/navigation_extensions.dart';
import 'package:pharmacy_app/utility/extensions/provider_extensions.dart';
import 'package:pharmacy_app/utility/extensions/size_extensions.dart';

class MyCustomElevatedButton extends StatelessWidget {
  final String buttonText;
  const MyCustomElevatedButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: myTextColorRed),
        onPressed: () async {
          if (buttonText == findTxt &&
              popUpCity.text.isNotEmpty &&
              popUpDistrict.text.isNotEmpty) {
            await box.write(boxKeyValueOfCity, popUpCity.text);
            await box.write(boxKeyValueOfDistrict, popUpDistrict.text);
            await context.readToSendDataOfHome();
            context.pushReplacementToView();
          }
        },
        child: FittedBox(
          child: Text(
            buttonText,
            style: TextStyle(
                color: appBackgColorLight,
                fontSize: context.dynamicWidht(0.06)),
          ),
        ));
  }
}
