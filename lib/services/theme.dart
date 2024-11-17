import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/values/index.dart';

import 'config.dart';
import 'storage.dart';

class ThemeService extends GetxController {
  static ThemeService get to => Get.find();

  void initTheme() {
    final theme = StorageService.to.getString(Constants.storageThemeMode);
    print('初始化主题，当前主题模式为: $theme');
    switch (theme) {
      case Constants.themeLight:
        AppTheme.mode = ThemeMode.light;
        break;
      case Constants.themeDark:
        AppTheme.mode = ThemeMode.dark;
        break;
      default:
        AppTheme.mode = ThemeMode.system;
        break;
    }
    AppTheme.setSystemStyle();
  }

  void setTheme(ThemeMode value) {
    switch (value) {
      case ThemeMode.system:
        StorageService.to
            .setString(Constants.storageThemeMode, Constants.themeSystem);
        break;
      case ThemeMode.light:
        StorageService.to
            .setString(Constants.storageThemeMode, Constants.themeLight);
        break;
      case ThemeMode.dark:
        StorageService.to
            .setString(Constants.storageThemeMode, Constants.themeDark);
        break;
    }
    AppTheme.mode = value;
    AppTheme.setSystemStyle();
    ConfigService.to.update();
  }

  @override
  void onInit() {
    initTheme();
    super.onInit();
  }
}
