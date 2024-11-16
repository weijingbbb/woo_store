import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_store/utils/index.dart';

import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  // 主视图
  Widget _buildView() {
    return Center(
        child: OutlinedButton(
      onPressed: () {
        Console.log("点击了登录按钮");
      },
      child: const Text("登录"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("login")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
