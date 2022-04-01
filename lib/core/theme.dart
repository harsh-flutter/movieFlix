import 'package:flutter/material.dart';

class ApplicationSizes {
  //general border and blure radius for elements in the app
  static const double borderRadius = 10.0;
  //general element padding
  static const double padding = 8.0;
  //general element padding
  static const double horizontalPadding = 16.0;
  //general element padding
  static const double verticalPadding = 12.0;
  //icon side padding
  static const double iconSidePadding = 3.0;
  //page side padding
  static const double pageSidePadding = 22.0;
  //page top padding
  static const double pageTopPadding = 40.0;
  //page top padding
  static const double pageTitlePadding = 36.0;
  //page bottom padding
  static const double pageBottomPadding = 40.0;
  //round buttons radius
  static const double roundButtonRadius = 15.0;
  // button height
  static const double buttonHeight = 42.0;
}

class ApplicationColors {
  static const Color primaryColorLight = Color(0xFF1F8CFF);

  static const Color backgroundLight = Color(0xFF252634);

  static const Color primaryTextColorLight = Color(0xFF000000);
  static const Color secondaryTextColor = Color(0xFF3E3E3E);
  static const Color greyHeadingTextLight = Color(0xFF4A4A4A);

  static const Color bottomNavigationBG = Color(0xFF1B1C2A);
  static const Color bottomNavigationIcon = Color(0xFFCDCED1);

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);

  static const Color greyBgColor = Color(0xFFF3F4F6);
  static const Color greyIconColor = Color(0xFF6B7280);
}

class OroPocketTheme {
  static get lightTheme {
    final themeData = ThemeData.light();
    final defaultTextTheme = themeData.textTheme.headline3?.copyWith(
        fontFamily: 'OpenSans', fontWeight: FontWeight.w600,
        color: ApplicationColors.primaryTextColorLight
    );

    return themeData.copyWith(
        primaryColor: ApplicationColors.primaryColorLight,
        bottomAppBarColor: ApplicationColors.bottomNavigationBG,
        scaffoldBackgroundColor: ApplicationColors.backgroundLight,
        iconTheme: const IconThemeData(color: ApplicationColors.bottomNavigationIcon),
        appBarTheme: const AppBarTheme(
            elevation: 0.0,
            titleSpacing: 5.0,
            backgroundColor: ApplicationColors.whiteColor,
            iconTheme: IconThemeData(color: ApplicationColors.bottomNavigationIcon),
            actionsIconTheme: IconThemeData(color: ApplicationColors.bottomNavigationIcon)
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ApplicationColors.primaryColorLight,
          unselectedItemColor: ApplicationColors.bottomNavigationIcon,
          backgroundColor: ApplicationColors.bottomNavigationBG,
          selectedLabelStyle: defaultTextTheme?.copyWith(fontSize: 1.0),
          unselectedLabelStyle: defaultTextTheme?.copyWith(fontSize: 1.0, color: ApplicationColors.bottomNavigationIcon),
        ),
        cardTheme: CardTheme(
          color: ApplicationColors.bottomNavigationBG,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 30.0,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              color: ApplicationColors.whiteColor,
              letterSpacing: 0.47,
              height: 1.2
          ),
          headline2: TextStyle(
              fontSize: 18.0,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w500,
              color: ApplicationColors.whiteColor,
              letterSpacing: 0.29,
              height: 1.2
          ),

          headline3: TextStyle(
              fontSize: 15.0,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w400,
              color: ApplicationColors.whiteColor,
              letterSpacing: 0.29,
              height: 1.2
          ),
          /*headline2: TextStyle(
          fontSize: 30.0,
          fontFamily: 'Droid',
          fontWeight: FontWeight.w500,
          color: ApplicationColors.primaryTextColorLight,
          letterSpacing: 0.47,
          height: 1.2
        ),

        headline6: TextStyle(
          fontSize: 12.0,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.w500,
          color: ApplicationColors.secondaryTextColor,
          letterSpacing: 0.29,
          height: 1.2
        ),
        bodyText1: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Droid',
          fontWeight: FontWeight.w500,
          color: ApplicationColors.primaryTextColorLight,
          letterSpacing: 0.32,
          height: 1.4
        ),
        bodyText2: TextStyle(
          fontSize: 16.0,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.w500,
          color: ApplicationColors.secondaryTextColor,
          letterSpacing: 0.29,
          height: 1.3
        ),
        caption: TextStyle(
          fontSize: 16.0,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.w700,
          color: ApplicationColors.accentColorLight,
          letterSpacing: 0.2,
          height: 1.0
        ),
        overline: TextStyle(
          fontSize: 14.0,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.w500,
          color: ApplicationColors.secondaryTextColor,
          letterSpacing: 0.2,
          height: 1.0
        ),
        button: TextStyle(
          fontSize: 15.0,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.w700,
          color: ApplicationColors.canvasColorLight,
          letterSpacing: 0.25,
          height: 1.2,
        ),*/
        )
    );
  }
}
