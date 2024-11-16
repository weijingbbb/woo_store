import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'colors.dart';

/// 主题
class AppTheme {
  /////////////////////////////////////////////////
  /// 自定义颜色
  /////////////////////////////////////////////////

  static const primary = Color(0xFF5F84FF);
  static const secondary = Color(0xFFFF6969);
  static const success = Color(0xFF23A757);
  static const warning = Color(0xFFFF1843);
  static const error = Color(0xFFDA1414);
  static const info = Color(0xFF2E5AAC);

  /////////////////////////////////////////////////
  /// 系统样式
  /////////////////////////////////////////////////

  static SystemUiOverlayStyle get systemStyle => const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

  static SystemUiOverlayStyle get systemStyleLight => systemStyle.copyWith(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

  static SystemUiOverlayStyle get systemStyleDark => systemStyle.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: const Color(0xFF0D0D0D),
        systemNavigationBarIconBrightness: Brightness.light,
      );

  static void setSystemStyle() {
    Brightness platformBrightness =
        Get.context?.theme.brightness ?? Brightness.light;
    ThemeMode mode = Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;

    switch (mode) {
      case ThemeMode.system:
        if (platformBrightness == Brightness.dark) {
          SystemChrome.setSystemUIOverlayStyle(systemStyleDark);
        } else {
          SystemChrome.setSystemUIOverlayStyle(systemStyleLight);
        }
        break;
      case ThemeMode.light:
        SystemChrome.setSystemUIOverlayStyle(systemStyleLight);
        break;
      case ThemeMode.dark:
        SystemChrome.setSystemUIOverlayStyle(systemStyleDark);
        break;
    }
  }

  /////////////////////////////////////////////////
  /// 主题
  /////////////////////////////////////////////////

  static ThemeData get light {
    ColorScheme scheme = MaterialTheme.lightScheme().copyWith(
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: const Color(0xFF333333),
      error: error,
      onError: Colors.white,
      //   tertiary: const Color(0xFFF4F6F9),
      //   outline: const Color(0xFFF4F6F9),
      //   shadow: const Color(0xFF5A6CEA).withOpacity(0.08),
    );
    return _getTheme(scheme);
  }

  static ThemeData get dark {
    ColorScheme scheme = MaterialTheme.darkScheme().copyWith(
      primary: primary,
      // onPrimary: Colors.white,
      secondary: secondary,
      // onSecondary: Colors.white,
      // surface: const Color(0xFF252525),
      // onSurface: Colors.white,
      error: error,
      onError: Colors.white,
      //   tertiary: const Color(0xFF141414),
      //   outline: const Color(0xFF252525),
      //   shadow: const Color(0xFF777777).withOpacity(0.08),
    );
    return _getTheme(scheme);
  }

  static ThemeData _getTheme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: false,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,

      // dialogTheme: DialogTheme(
      //   elevation: 0,
      //   titleTextStyle: TextStyle(
      //     fontSize: 22.w,
      //     fontWeight: FontWeight.w600,
      //   ),
      //   contentTextStyle: TextStyle(fontSize: 20.w),
      //   backgroundColor: scheme.brightness == Brightness.light
      //       ? scheme.surface
      //       : scheme.tertiary,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(30.w),
      //   ),
      // ),

      // bottomSheetTheme: BottomSheetThemeData(
      //   elevation: 0,
      //   backgroundColor: scheme.brightness == Brightness.light
      //       ? scheme.surface
      //       : scheme.tertiary,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(30.w),
      //       topRight: Radius.circular(30.w),
      //     ),
      //   ),
      // ),

      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 56.w,
        iconTheme: IconThemeData(
          color: scheme.onSurface,
          size: 22.w,
        ),
        titleTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: 24.w,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
        toolbarTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: 22.w,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),

      // textTheme: TextTheme(
      //   bodyMedium: TextStyle(
      //     fontSize: 16.w,
      //     color: scheme.onSurface,
      //   ),
      //   labelLarge: TextStyle(
      //     fontWeight: FontWeight.w600,
      //     fontSize: 16.w,
      //     height: 1.2,
      //     color: scheme.onSurface,
      //   ),
      // ),

      // bottomAppBarTheme: BottomAppBarTheme(
      //   elevation: 0,
      //   color: scheme.surface,
      // ),

      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   type: BottomNavigationBarType.fixed,
      //   elevation: 0,
      //   backgroundColor: scheme.surface,
      //   unselectedItemColor: scheme.onSurface.withOpacity(0.5),
      //   selectedItemColor: scheme.primary,
      //   unselectedLabelStyle: TextStyle(fontSize: 13.w, height: 1.6),
      //   selectedLabelStyle: TextStyle(fontSize: 13.w, height: 1.6),
      //   unselectedIconTheme: IconThemeData(
      //     size: 24.w,
      //     color: scheme.onSurface.withOpacity(0.5),
      //   ),
      //   selectedIconTheme: IconThemeData(
      //     size: 24.w,
      //     color: scheme.primary,
      //   ),
      // ),

      // outlinedButtonTheme: OutlinedButtonThemeData(
      //   style: ButtonStyle(
      //     elevation: WidgetStateProperty.all(0),
      //     minimumSize: WidgetStateProperty.all(Size.zero),
      //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //     overlayColor: WidgetStateProperty.all(Colors.transparent),
      //   ),
      // ),

      //   inputDecorationTheme: InputDecorationTheme(
      //     isCollapsed: true,
      //     isDense: true,
      //     filled: true,
      //     fillColor: scheme.surface,
      //     labelStyle: TextStyle(
      //       fontSize: 16.w,
      //       color: scheme.onSurface,
      //       fontWeight: FontWeight.w600,
      //     ),
      //     helperStyle: TextStyle(
      //       fontSize: 14.w,
      //       color: scheme.onSurface.withOpacity(0.7),
      //     ),
      //     contentPadding: EdgeInsets.symmetric(
      //       horizontal: 20.w,
      //       vertical: 14.w,
      //     ),
      //     border: OutlineInputBorder(
      //       borderSide: BorderSide(color: scheme.outline, width: 2.w),
      //       borderRadius: BorderRadius.all(Radius.circular(25.w)),
      //     ),
      //     enabledBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: scheme.outline, width: 2.w),
      //       borderRadius: BorderRadius.all(Radius.circular(25.w)),
      //     ),
      //     disabledBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: scheme.outline, width: 2.w),
      //       borderRadius: BorderRadius.all(Radius.circular(25.w)),
      //     ),
      //     focusedBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: scheme.primary, width: 2.w),
      //       borderRadius: BorderRadius.all(Radius.circular(25.w)),
      //     ),
      //     errorBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: error, width: 2.w),
      //       borderRadius: BorderRadius.all(Radius.circular(25.w)),
      //     ),
      //     focusedErrorBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: error, width: 2.w),
      //       borderRadius: BorderRadius.all(Radius.circular(100.w)),
      //     ),
      //   ),
      //   tabBarTheme: TabBarTheme(
      //     labelColor: scheme.primary,
      //     unselectedLabelColor: scheme.surface,
      //     labelStyle: TextStyle(
      //       color: scheme.onPrimary,
      //       fontSize: 16.w,
      //       fontWeight: FontWeight.w600,
      //     ),
      //     unselectedLabelStyle: TextStyle(
      //       color: scheme.primary,
      //       fontSize: 16.w,
      //       fontWeight: FontWeight.w600,
      //     ),
      //     labelPadding: EdgeInsets.symmetric(horizontal: 6.w),
      //   ),
      //   dividerTheme: DividerThemeData(
      //     thickness: 1.w,
      //     color: scheme.onSurface.withOpacity(0.08),
      //   ),
    );
  }
}
