import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:validatorless/validatorless.dart';
import 'package:woo_store/components/index.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/routes/index.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/widgets/index.dart';

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
          appBar: AppBar(title: Text(S.of(context).login)),
          body: SafeArea(
            child: _buildView(context),
          ),
        );
      },
    );
  }

  // 主框架
  Widget _buildView(BuildContext context) {
    return SingleChildScrollView(
      child: <Widget>[
        // 标题
        PageTitleWidget(
          title: S.of(context).login_page_title,
        ).paddingTop(50.w),
        // 表单
        _buildForm(context),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .paddingHorizontal(AppSpace.page),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
            key: controller.formKey,
            child: <Widget>[
              InputFormFieldWidget(
                controller: controller.userNameController,
                labelText: S.of(context).username_iput_label,
                prefix: const Icon(Icons.person),
                validator: Validatorless.multiple([
                  Validatorless.required(S.of(context).validator_required),
                  Validatorless.between(
                      6, 18, S.of(context).validator_username),
                ]),
              ).paddingBottom(AppSpace.listRow.w),
              // password
              InputFormFieldWidget(
                controller: controller.passwordController,
                labelText: S.of(context).password_iput_label,
                obscureText: true,
                prefix: const Icon(Icons.person),
                validator: Validatorless.multiple([
                  Validatorless.required(S.of(context).validator_required),
                  Validatorless.between(
                      6, 18, S.of(context).validator_password),
                ]),
              ).paddingBottom(AppSpace.listRow.w * 2),
              // Forgot Password?
              TextWidget.label(S.of(context).login_page_forgot_password)
                  .alignRight()
                  .paddingBottom(AppSpace.listRow),
              // register
              TextWidget.label(S.of(context).login_page_sign_up)
                  .onTap(() {
                    // Get.offNamed(RouteNames.systemRegister);
                    context.replaceNamed(RouteNames.systemRegister);
                  })
                  .alignRight()
                  .paddingBottom(50.w),
              // 登录按钮
              ButtonWidget.primary(
                S.of(context).login_button,
                onTap: () => controller.onSignIn(context),
              ).width(double.infinity).paddingBottom(30.w),
            ].toColumn().paddingVertical(10))
        .paddingAll(AppSpace.card);
  }
}
