import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_store/routes/index.dart';
import 'package:woo_store/services/index.dart';
import 'package:woo_store/utils/index.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  // 主视图
  Widget _buildView() {
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
          )
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
