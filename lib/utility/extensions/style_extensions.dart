import 'package:flutter/material.dart';
import 'package:pharmacy_app/utility/constants.dart';
import 'package:pharmacy_app/utility/extensions/size_extensions.dart';

extension CustomTextStyle on BuildContext {
  TextStyle get customTitleLargeTextStyle {
    return Theme.of(this).textTheme.titleLarge!.copyWith(
        fontSize: dynamicWidht(0.048), overflow: TextOverflow.ellipsis);
  }
}

extension CustomTextStyle2 on BuildContext {
  TextStyle get myStyle {
    return TextStyle(
        fontSize: Theme.of(this).textTheme.labelMedium!.fontSize,
        color: Theme.of(this).brightness == Brightness.dark
            ? appBackgColorLight
            : appBackColorDark);
  }
}
