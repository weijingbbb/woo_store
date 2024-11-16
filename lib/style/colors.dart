import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff515b92),
      surfaceTint: Color(0xff515b92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffdee1ff),
      onPrimaryContainer: Color(0xff0a164b),
      secondary: Color(0xff505b92),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdee1ff),
      onSecondaryContainer: Color(0xff09164b),
      tertiary: Color(0xff824c76),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd7f2),
      onTertiaryContainer: Color(0xff35082f),
      error: Color(0xff904a43),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad5),
      onErrorContainer: Color(0xff3b0907),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff1b1b21),
      onSurfaceVariant: Color(0xff46464f),
      outline: Color(0xff767680),
      outlineVariant: Color(0xffc6c5d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffbac3ff),
      primaryFixed: Color(0xffdee1ff),
      onPrimaryFixed: Color(0xff0a164b),
      primaryFixedDim: Color(0xffbac3ff),
      onPrimaryFixedVariant: Color(0xff394379),
      secondaryFixed: Color(0xffdee1ff),
      onSecondaryFixed: Color(0xff09164b),
      secondaryFixedDim: Color(0xffb9c3ff),
      onSecondaryFixedVariant: Color(0xff384379),
      tertiaryFixed: Color(0xffffd7f2),
      onTertiaryFixed: Color(0xff35082f),
      tertiaryFixedDim: Color(0xfff4b2e2),
      onTertiaryFixedVariant: Color(0xff67355d),
      surfaceDim: Color(0xffdbd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f2fa),
      surfaceContainer: Color(0xffefedf4),
      surfaceContainerHigh: Color(0xffe9e7ef),
      surfaceContainerHighest: Color(0xffe3e1e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff353f74),
      surfaceTint: Color(0xff515b92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6771aa),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff343f74),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6671aa),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff633159),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9a628e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff6e302a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffaa6057),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff1b1b21),
      onSurfaceVariant: Color(0xff42424b),
      outline: Color(0xff5e5e67),
      outlineVariant: Color(0xff7a7a83),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffbac3ff),
      primaryFixed: Color(0xff6771aa),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff4e5890),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6671aa),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4e5890),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff9a628e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff7f4a74),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdbd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f2fa),
      surfaceContainer: Color(0xffefedf4),
      surfaceContainerHigh: Color(0xffe9e7ef),
      surfaceContainerHighest: Color(0xffe3e1e9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff121d52),
      surfaceTint: Color(0xff515b92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff353f74),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff111d52),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff343f74),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3d0f37),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff633159),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff44100c),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff6e302a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff23232b),
      outline: Color(0xff42424b),
      outlineVariant: Color(0xff42424b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffeaeaff),
      primaryFixed: Color(0xff353f74),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff1e285d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff343f74),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1d285d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff633159),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff491b42),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdbd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f2fa),
      surfaceContainer: Color(0xffefedf4),
      surfaceContainerHigh: Color(0xffe9e7ef),
      surfaceContainerHighest: Color(0xffe3e1e9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbac3ff),
      surfaceTint: Color(0xffbac3ff),
      onPrimary: Color(0xff222c61),
      primaryContainer: Color(0xff394379),
      onPrimaryContainer: Color(0xffdee1ff),
      secondary: Color(0xffb9c3ff),
      onSecondary: Color(0xff212c61),
      secondaryContainer: Color(0xff384379),
      onSecondaryContainer: Color(0xffdee1ff),
      tertiary: Color(0xfff4b2e2),
      onTertiary: Color(0xff4d1e46),
      tertiaryContainer: Color(0xff67355d),
      onTertiaryContainer: Color(0xffffd7f2),
      error: Color(0xffffb4ab),
      onError: Color(0xff561e19),
      errorContainer: Color(0xff73342d),
      onErrorContainer: Color(0xffffdad5),
      surface: Color(0xff121318),
      onSurface: Color(0xffe3e1e9),
      onSurfaceVariant: Color(0xffc6c5d0),
      outline: Color(0xff90909a),
      outlineVariant: Color(0xff46464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e1e9),
      inversePrimary: Color(0xff515b92),
      primaryFixed: Color(0xffdee1ff),
      onPrimaryFixed: Color(0xff0a164b),
      primaryFixedDim: Color(0xffbac3ff),
      onPrimaryFixedVariant: Color(0xff394379),
      secondaryFixed: Color(0xffdee1ff),
      onSecondaryFixed: Color(0xff09164b),
      secondaryFixedDim: Color(0xffb9c3ff),
      onSecondaryFixedVariant: Color(0xff384379),
      tertiaryFixed: Color(0xffffd7f2),
      onTertiaryFixed: Color(0xff35082f),
      tertiaryFixedDim: Color(0xfff4b2e2),
      onTertiaryFixedVariant: Color(0xff67355d),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff38393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff292a2f),
      surfaceContainerHighest: Color(0xff34343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbfc8ff),
      surfaceTint: Color(0xffbac3ff),
      onPrimary: Color(0xff040f46),
      primaryContainer: Color(0xff838dc8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffbfc8ff),
      onSecondary: Color(0xff030f46),
      secondaryContainer: Color(0xff838dc8),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff9b6e7),
      onTertiary: Color(0xff2e032a),
      tertiaryContainer: Color(0xffb97eab),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff330403),
      errorContainer: Color(0xffcc7b72),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff121318),
      onSurface: Color(0xfffdfaff),
      onSurfaceVariant: Color(0xffcbcad4),
      outline: Color(0xffa2a2ac),
      outlineVariant: Color(0xff82828c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e1e9),
      inversePrimary: Color(0xff3a447a),
      primaryFixed: Color(0xffdee1ff),
      onPrimaryFixed: Color(0xff00093f),
      primaryFixedDim: Color(0xffbac3ff),
      onPrimaryFixedVariant: Color(0xff283267),
      secondaryFixed: Color(0xffdee1ff),
      onSecondaryFixed: Color(0xff000a3e),
      secondaryFixedDim: Color(0xffb9c3ff),
      onSecondaryFixedVariant: Color(0xff273267),
      tertiaryFixed: Color(0xffffd7f2),
      onTertiaryFixed: Color(0xff270024),
      tertiaryFixedDim: Color(0xfff4b2e2),
      onTertiaryFixedVariant: Color(0xff54244c),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff38393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff292a2f),
      surfaceContainerHighest: Color(0xff34343a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffdfaff),
      surfaceTint: Color(0xffbac3ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffbfc8ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffcfaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbfc8ff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9fa),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff9b6e7),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff121318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffdfaff),
      outline: Color(0xffcbcad4),
      outlineVariant: Color(0xffcbcad4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e1e9),
      inversePrimary: Color(0xff1b255a),
      primaryFixed: Color(0xffe3e5ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffbfc8ff),
      onPrimaryFixedVariant: Color(0xff040f46),
      secondaryFixed: Color(0xffe3e5ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffbfc8ff),
      onSecondaryFixedVariant: Color(0xff030f46),
      tertiaryFixed: Color(0xffffddf3),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff9b6e7),
      onTertiaryFixedVariant: Color(0xff2e032a),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff38393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff292a2f),
      surfaceContainerHighest: Color(0xff34343a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
