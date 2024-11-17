import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_store/services/index.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/utils/index.dart';


class HomeController extends GetxController {
  HomeController();

  

  bool get isSystem => AppTheme.mode == ThemeMode.system;

  bool get isLight => AppTheme.mode == ThemeMode.light;

  bool get isDark => AppTheme.mode == ThemeMode.dark;

  void setThemeMode(ThemeMode mode) {
    Console.log("点击了切换主题, 主题为: $mode");
    ThemeService.to.setTheme(mode);
    update();
  }

}
