import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/colors.dart';

abstract class Styles {
  static TextStyle textStyle14(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w600,
      color: kTextColor,
    );
  }

  static TextStyle textStyle28(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.w600,
      color: kTextColor,
    );
  }

  static TextStyle textStyle21(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 21),
      fontWeight: FontWeight.w600,
      color: kTextColor,
    );
  }

  static TextStyle textStyle18(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w600,
      color: kTextColor,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 800) {
    return width / 375;
  } else if (width < 1200) {
    return width / 1000;
  } else {
    return width / 1440;
  }
}
