import 'package:flutter/material.dart';

import 'app_settengs.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(),
    progressIndicatorTheme: ProgressIndicatorThemeData(),
    buttonTheme: ButtonThemeData(),
    pageTransitionsTheme: PageTransitionsTheme(),
    scaffoldBackgroundColor: Colors.teal,
    appBarTheme: AppBarTheme(
      color: lightAppBarColor,
      iconTheme: IconThemeData(
        color: lightAppBarIconColor,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: lightPrimaryColor,
      onPrimary: Colors.white,
      primaryVariant: lightPrimaryColor,
      secondary: lightSecondaryColor,
    ),
    cardTheme: CardTheme(
      color: lightCardColor,
    ),
    iconTheme: IconThemeData(
      color: lightIconColor,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: lightTtitletextColor,
        fontSize: 20.0,
      ),
      subtitle1: TextStyle(
        color: lightSuptitleTextColor,
        fontSize: 18.0,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkScaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      color: darkAppBarColor,
      iconTheme: IconThemeData(
        color: darkAppBarIconColor,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: darkPrimaryColor,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: darkSecondaryColor,
    ),
    cardTheme: CardTheme(
      color: darkCardColor,
    ),
    iconTheme: IconThemeData(
      color: darkIconColor,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: darkTitletextColor,
        fontSize: 20.0,
      ),
      subtitle1: TextStyle(
        color: darkSuptitletextColor,
        fontSize: 18.0,
      ),
    ),
  );
}
