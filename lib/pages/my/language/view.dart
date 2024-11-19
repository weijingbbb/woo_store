import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/services/index.dart';

import 'index.dart';

class LanguagePage extends GetView<LanguageController> {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      init: LanguageController(),
      id: "language",
      builder: (_) {
        return Scaffold(
            appBar: AppBar(title: Text(S.current.language_page_title)),
            body: SafeArea(
              // child: ListView(
              //   children: [
              //     for (var el in S.delegate.supportedLocales)
              //       ListTile(
              //         title: Text(el.languageCode),
              //         trailing: CupertinoSwitch(
              //             value: el.languageCode ==
              //                 LanguageService.to.locale.languageCode,
              //             onChanged: (_) {
              //               // LanguageService.to.setLanguage(el);
              //               controller.changeLanguage(el);
              //             }),
              //       )
              //   ],
              // ),
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    final item = S.delegate.supportedLocales[index];
                    final currentLocale =
                        LanguageService.to.locale.languageCode;
                    final language =
                        S.delegate.supportedLocales[index].languageCode;
                    return ListTile(
                      title: Text(item.languageCode.tr),
                      trailing: CupertinoSwitch(
                          value: language == currentLocale,
                          onChanged: (_) {
                            controller.changeLanguage(item);
                          }),
                    );
                  },
                  itemCount: S.delegate.supportedLocales.length),
            ));
      },
    );
  }
}
