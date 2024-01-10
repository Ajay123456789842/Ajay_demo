import 'package:demo/constants/app_colors.dart';
import 'package:flutter/material.dart';

TextStyle getTextStyle({
  double? fontSize = 14,
  Color? color,
  bool? isPrimaryColor = false,
  FontWeight? fontWeight = FontWeight.w500,
  String? fontFamily = 'Roboto',
  Color? backgroundColor,
  FontStyle? fontStyle,
  double? letterSpacing = 0,
  double? wordSpacing = 0,
  double? height = 0,
  TextOverflow overflow = TextOverflow.ellipsis,
}) {
  // fontSize = fontSize == 12 && Device.get().isTablet ? 14 : fontSize;
  return TextStyle(
    // color:Colors.,
    //  isPrimaryColor!
    //     ? AppColors.primaryColor
    //     : color ?? AppColors.whiteTextColor,
    color: color ?? AppColors.white,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    backgroundColor: backgroundColor,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    height: height,
    overflow: overflow,
  );
}
