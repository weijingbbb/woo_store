import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_store/utils/index.dart';

import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("login")),
          body: SafeArea(
            child: Center(
                child: OutlinedButton(
              onPressed: () {
                controller.onSignIn();
                // UserService.to.saveLoginStatus(true);
                // context.goNamed(RouteNames.systemMain);
                // 登录成功后跳转到首页
                // 如果有历史记录，则跳转到历史记录的上一页，否则跳转到首页
                // final prev = Routes.history[Routes.history.length - 2];
                // if (prev.isEmpty) {
                //   context.pushNamed(RouteNames.systemMain);
                // } else {
                //   context.pushNamed(prev);
                // }
              },
              child: const Text("登录"),
            )),
          ),
        );
      },
    );
  }
}
