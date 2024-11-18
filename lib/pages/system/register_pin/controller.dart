import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:woo_store/apis/index.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/models/index.dart';
import 'package:woo_store/routes/index.dart';
import 'package:woo_store/utils/index.dart';

class RegisterPinController extends GetxController {
  RegisterPinController(this.singupReq, this.context);
  final BuildContext context;

  final UserRegisterReq singupReq;

// 表单 key
  GlobalKey formKey = GlobalKey<FormState>();
  // ping 文字输入控制器
  TextEditingController pinController = TextEditingController();

  String pinCheckValue = '111111';

  String? pinValidator(val) {
    //  校验 pin，这里真实业务需要调用接口
    return val == pinCheckValue ? null : S.of(context).register_pin_error;
  }

  void onPinSubmit(String pin) {
    _register();
  }

  // 点击提交
  void onBtnSubmit() {
    _register();
  }

  // 注册
  Future<void> _register() async {
    try {
      Loading.show();

      // 检查 Pin
      if (pinController.text.isEmpty || pinController.text != pinCheckValue) {
        return Loading.error(S.of(context).register_pin_fail);
      }

      // 暂时提交，后续改 aes 加密后处理
      bool isOk = await UserApi.register(singupReq);
      if (isOk) {
        if (context.mounted) {
          Loading.success(S.of(context).register_pin_success);
          context.goNamed(RouteNames.systemLogin);
        }
      }
    } finally {
      Loading.dismiss();
    }
  }

  @override
  void onReady() {
    super.onReady();
    Console.log("RegisterPinController onReady--------${singupReq.toJson()}");
  }

  @override
  void onClose() {
    super.onClose();
    pinController.dispose();
  }
}
