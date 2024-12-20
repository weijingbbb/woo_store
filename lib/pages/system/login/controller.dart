import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:woo_store/apis/index.dart';
import 'package:woo_store/models/index.dart';
import 'package:woo_store/routes/index.dart';
import 'package:woo_store/services/index.dart';
import 'package:woo_store/utils/index.dart';

class LoginController extends GetxController {
  LoginController();

  /// 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  /// 定义输入控制器
  TextEditingController userNameController =
      TextEditingController(text: "ducafecat5");
  TextEditingController passwordController =
      TextEditingController(text: "123456");

  /// Sign In
  Future<void> onSignIn(BuildContext context) async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();

        // aes 加密密码
        var password = EncryptUtil().aesEncode(passwordController.text);

        // api 请求
        UserTokenModel res = await UserApi.login(UserLoginReq(
          username: userNameController.text,
          password: password,
        ));

        // 本地保存 token
        await UserService.to.saveToken(res.token!);
        // 获取用户资料
        await UserService.to.getProfile();

        Loading.success();
        // 跳转至首页
        if (context.mounted) {
          context.goNamed(RouteNames.systemMain);
        }
        // Get.back(result: true);
      } finally {
        Loading.dismiss();
      }
    }
  }
}
