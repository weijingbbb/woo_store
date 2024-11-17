import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/routes/index.dart';
import 'package:woo_store/services/index.dart';
import 'package:woo_store/utils/index.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  // 主视图
  Widget _buildView() {
    List<Locale> list = S.delegate.supportedLocales;
    List<Widget> widgets = [];
    for (var el in list) {
      widgets.add(ListTile(
        title: Text(el.languageCode),
        trailing: CupertinoSwitch(
            value: el.languageCode == LanguageService.to.locale.languageCode,
            onChanged: (_) {
              LanguageService.to.setLanguage(el);
            }),
      ));
    }

    return Center(
      child: Column(
        children: [
          const Text("home"),
          OutlinedButton(
            onPressed: () {
              Console.log("点击了退出登录");
              UserService.to.saveLoginStatus(false);
              Routes.clearHistory();
            },
            child: const Text('退出登录'),
          ),
          const SizedBox(height: 20),
          ...widgets,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("home")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
