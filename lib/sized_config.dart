import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizedConfig {
  static double deviceWidth;
  static double deviceHeight;
  static bool isResponsiveFontSizeWidth;
  static MediaQueryData _mediaQueryData;

  static final double designPhoneWidth = 375;
  static final double designPhoneHeight = 812;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    deviceWidth = _mediaQueryData.size.width;
    deviceHeight = _mediaQueryData.size.height;
    isResponsiveFontSizeWidth = (deviceWidth / deviceHeight) < (9 / 16);
  }
}

double getProportionateScreenHeight(double value) {
  return (value / SizedConfig.designPhoneHeight) * SizedConfig.deviceHeight;
}

double getProportionateScreenWidth(double value) {
  return (value / SizedConfig.designPhoneWidth) * SizedConfig.deviceWidth;
}

double getProportionateFontSize(double value) {
  return SizedConfig.isResponsiveFontSizeWidth
      ? (value / SizedConfig.designPhoneWidth) * SizedConfig.deviceWidth
      : (value / SizedConfig.designPhoneHeight) * SizedConfig.deviceHeight;
}
