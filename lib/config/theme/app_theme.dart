import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppTheme {
  // private contructor
  const AppTheme._();

  // final FlexSchemeColor _schemeLight = FlexSchemeColor.from(
  //   primary: const Color(0xFF00ABB2),
  //   secondary: const Color(0xF015963),
  //   brightness: Brightness.light,
  // );

  static final light = FlexThemeData.light(
    primary: const Color(0xF015963),
    secondary: const Color(0xFF00ABB2),
    primaryContainer: const Color(0xFF9ABDC1),
    secondaryContainer: const Color(0xFFE9F7F8),

    // colors: _useScheme ? null : _schemeLight,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
    blendLevel: 40,
    appBarStyle: FlexAppBarStyle.primary,
    appBarOpacity: 0.95,
    appBarElevation: 0,
    transparentStatusBar: true,
    tabBarStyle: FlexTabBarStyle.forBackground,
    tooltipsMatchBackground: true,
    swapColors: true,
    lightIsWhite: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    fontFamily: GoogleFonts.poppins().fontFamily,
    subThemesData: const FlexSubThemesData(
      useTextTheme: true,
      fabUseShape: true,
      interactionEffects: true,
      bottomNavigationBarElevation: 0,
      bottomNavigationBarOpacity: 1,
      navigationBarOpacity: 1,
      navigationBarMutedUnselectedIcon: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      blendOnColors: true,
      blendTextTheme: true,
      popupMenuOpacity: 0.95,
    ),
  );
}
