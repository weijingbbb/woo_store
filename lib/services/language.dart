import 'dart:ui';

import 'package:get/get.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/utils/index.dart';
import 'package:woo_store/values/index.dart';

import 'config.dart';
import 'storage.dart';

class LanguageService extends GetxController {
  static LanguageService get to => Get.find();

  Locale locale = PlatformDispatcher.instance.locale;

  void initLanguage() {
    final language = StorageService.to.getString(Constants.storageLanguageCode);
    if (language.isEmpty) return;
    var index = S.delegate.supportedLocales
        .indexWhere((element) => element.languageCode == language);
    if (index == -1) return;
    locale = S.delegate.supportedLocales[index];
    ConfigService.to.update();
  }

  void setLanguage(Locale value) async {
    locale = value;
    StorageService.to
        .setString(Constants.storageLanguageCode, value.languageCode);
    await S.delegate.load(locale);
    Console.log("设置语言为：${value.languageCode}");
    ConfigService.to.update();
  }

  @override
  void onInit() {
    initLanguage();
    super.onInit();
  }
}
