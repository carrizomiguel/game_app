import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ThemeApp {
  dark,
  light
}

// Constants for Dark Theme
const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);

// Constants for Light Theme
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);

const kAccentColor = Color(0xFF069199);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    brightness: Brightness.dark,
    secondary: kAccentColor
  ),
  iconTheme: ThemeData.dark().iconTheme.copyWith(
    color: kLightSecondaryColor
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: kLightSecondaryColor,
    displayColor: kLightSecondaryColor
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ),
    backgroundColor: kDarkPrimaryColor
  )
);

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    brightness: Brightness.light,
    secondary: kAccentColor
  ),
  iconTheme: ThemeData.light().iconTheme.copyWith(
    color: kDarkSecondaryColor,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    fontFamily: 'SFProText',
    bodyColor: kDarkSecondaryColor,
    displayColor: kDarkSecondaryColor,
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ),
    backgroundColor: kLightPrimaryColor,
  )
);

const kTitleTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
);

const kCaptionTextStyle = TextStyle(
  fontWeight: FontWeight.w100,
);