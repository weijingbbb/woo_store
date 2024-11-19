import 'dart:ui';

import 'package:get/get.dart';
import 'package:woo_store/services/index.dart';

class LanguageController extends GetxController {
  LanguageController();

  void changeLanguage(Locale locale) {
    LanguageService.to.setLanguage(locale);
    update(['language']); // 通知视图更新(刷新)
  }
}
