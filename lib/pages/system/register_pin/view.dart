import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_store/components/index.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/models/index.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/widgets/index.dart';

import 'index.dart';

class RegisterPinPage extends GetView<RegisterPinController> {
  const RegisterPinPage({super.key, required this.singupReq});
  final UserRegisterReq singupReq;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPinController>(
      init: RegisterPinController(singupReq, context),
      id: "register_pin",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(S.of(context).register_pin_appbar_title)),
          body: SafeArea(
            child: _buildView(context),
          ),
        );
      },
    );
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    return SingleChildScrollView(
      child: <Widget>[
        // 头部标题
        PageTitleWidget(
          title: S.of(context).register_pin_page_title,
          desc: S.of(context).register_pin_page_tips,
        ),

        // 表单
        _buildForm(context).card(),
        const Text('输入6个1进行测试').center(),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          )
          .paddingHorizontal(AppSpace.page),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
            key: controller.formKey, //设置globalKey，用于后面获取FormState
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: <Widget>[
              // pin
              PinPutWidget(
                controller: controller.pinController,
                validator: controller.pinValidator, // 验证函数
                // 当用户完成 pin 输入时触发
                onSubmit: controller.onPinSubmit,
              ).paddingBottom(50.w),
              // 提交按钮
              ButtonWidget.primary(
                S.of(context).submit,
                onTap: controller.onBtnSubmit,
              ).paddingBottom(AppSpace.listRow),
              // 返回按钮
              ButtonWidget.ghost(
                S.of(context).cancel,
                onTap: () {
                  context.pop();
                },
              ),
            ].toColumn())
        .paddingAll(AppSpace.card);
  }
}
