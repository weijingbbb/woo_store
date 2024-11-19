import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_store/generated/l10n.dart';

import 'index.dart';

class ThemePage extends GetView<ThemeController> {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(S.current.theme_page_title)),
          body: SafeArea(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(S.current.theme_page_system),
                  trailing: CupertinoSwitch(
                      value: controller.isSystem,
                      onChanged: (_) {
                        controller.setThemeMode(ThemeMode.system);
                      }),
                ),
                ListTile(
                  title: Text(S.current.theme_page_light),
                  trailing: CupertinoSwitch(
                      value: controller.isLight,
                      onChanged: (_) {
                        controller.setThemeMode(ThemeMode.light);
                      }),
                ),
                ListTile(
                  title: Text(S.current.theme_page_dark),
                  trailing: CupertinoSwitch(
                      value: controller.isDark,
                      onChanged: (_) {
                        controller.setThemeMode(ThemeMode.dark);
                      }),
                ),
              ].toList(),
            ),
          ),
        );
      },
    );
  }
}
