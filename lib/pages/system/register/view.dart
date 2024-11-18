import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import 'package:woo_store/components/index.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/widgets/index.dart';

import 'index.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      id: "register",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(S.of(context).signup)),
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
          title: S.of(context).signup_page_title,
        ).paddingTop(50.w),

        // 表单
        _buildForm(context)
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .padding(
            bottom: AppSpace.page * 5,
          ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        InputFormFieldWidget(
          autofocus: true,
          controller: controller.userNameController,
          labelText: S.of(context).username_iput_label,
          prefix: const Icon(Icons.person),
          validator: Validatorless.multiple([
            Validatorless.required(S.of(context).validator_required),
            Validatorless.between(6, 18, S.of(context).validator_username),
          ]),
        ).paddingBottom(AppSpace.listRow.w),
        // email
        InputFormFieldWidget(
          controller: controller.emailController,
          labelText: S.of(context).email_iput_label,
          keyboardType: TextInputType.emailAddress,
          prefix: const Icon(Icons.email),
          // suffix: const Icon(Icons.done),
          validator: Validatorless.multiple([
            Validatorless.required(S.of(context).validator_required),
            Validatorless.email(S.of(context).validator_email),
          ]),
        ).paddingBottom(AppSpace.listRow.w),
        // first name
        InputFormFieldWidget(
          controller: controller.firstNameController,
          labelText: S.of(context).first_name_iput_label,
          prefix: const Icon(Icons.person),
          // suffix: const Icon(Icons.done),
          validator: Validatorless.multiple([
            Validatorless.required(S.of(context).validator_required),
            Validatorless.between(3, 18, S.of(context).validator_length),
          ]),
        ).paddingBottom(AppSpace.listRow.w),
        // last name
        InputFormFieldWidget(
          controller: controller.lastNameController,
          labelText: S.of(context).last_name_iput_label,
          prefix: const Icon(Icons.person),
          // suffix: const Icon(Icons.done),
          validator: Validatorless.multiple([
            Validatorless.required(S.of(context).validator_required),
            Validatorless.between(3, 18, S.of(context).validator_length),
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
            Validatorless.between(6, 18, S.of(context).validator_password),
          ]),
        ).paddingBottom(AppSpace.listRow.w * 2),
        // 注册按钮
        _buildBtnSignUp(context),
        // 提示
        _buildTips(context),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .padding(
            horizontal: AppSpace.page * 2,
          ),
    );
  }

  Widget _buildBtnSignUp(BuildContext context) {
    return ButtonWidget.primary(
      S.of(context).signup_button,
      onTap: () => controller.onSignUp(context),
    ).width(double.infinity).paddingBottom(AppSpace.listRow);
  }

  // 提示
  Widget _buildTips(BuildContext context) {
    return <Widget>[
      // 提示
      TextWidget.h4(S.of(context).signup_page_tips),

      // 登录文字按钮
      ButtonWidget.ghost(
        S.of(context).login_button,
        onTap: () => controller.onSignIn(context),
      )
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
