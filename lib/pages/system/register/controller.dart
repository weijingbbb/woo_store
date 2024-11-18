import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:woo_store/models/index.dart';
import 'package:woo_store/routes/index.dart';
import 'package:woo_store/utils/index.dart';

class RegisterController extends GetxController {
  RegisterController();

  GlobalKey formKey = GlobalKey<FormState>();

  // 用户名
  TextEditingController userNameController =
      TextEditingController(text: "ducafecat5");
  // 邮件
  TextEditingController emailController =
      TextEditingController(text: "ducafecat5@gmail.com");
  // 姓
  TextEditingController firstNameController =
      TextEditingController(text: "ducafe");
  // 名
  TextEditingController lastNameController = TextEditingController(text: "cat");
  // 密码
  TextEditingController passwordController =
      TextEditingController(text: "12345678");

  onSignUp(BuildContext context) {
    if ((formKey.currentState as FormState).validate()) {
      // aes 加密密码
      var password = EncryptUtil().aesEncode(passwordController.text);

      Console.log('点击了注册按钮');
      context.push(RouteNames.systemRegisterPin,
          extra: UserRegisterReq.fromJson({
            "username": userNameController.text,
            "email": emailController.text,
            "firstName": firstNameController.text,
            "lastName": lastNameController.text,
            "password": password,
          }));
    }
  }

  // 登录
  void onSignIn(BuildContext context) {
    context.pushNamed(RouteNames.systemLogin);
  }

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
  }
}
