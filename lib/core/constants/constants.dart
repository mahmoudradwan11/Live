import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConstant {
  static const String baseUrl = 'https://newsapi.org/';
  static const String egyptNews = 'v2/top-headlines';
  static const String apiKey = '6c13d55401484eb49c81a4bca91ed2e5';
  static const String country = 'eg';
  static const String cateSports = 'sports';
  static const String cateBusiness = 'business';
}
String? country;
var defaultColor = Colors.blue;
ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      // fontFamily: 'Jannah'
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      color: Colors.black,
      height: 1.3,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
);
