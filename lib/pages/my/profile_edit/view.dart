import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import 'package:woo_store/components/index.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/widgets/index.dart';

import 'index.dart';

class ProfileEditPage extends GetView<ProfileEditController> {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileEditController>(
      init: ProfileEditController(context),
      id: "profile_edit",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("修改信息")),
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
        // 头像
        _buildAvatar(context),

        // 表单
        Form(
          key: controller.formKey, //设置globalKey，用于后面获取FormState
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: <Widget>[
            // profile 表单
            _buildProfileForm(context),
            // password 表单
            _buildPasswordForm(context),
          ].toColumn(),
        ).paddingBottom(AppSpace.card),

        // 保存按钮
        ButtonWidget.primary(
          S.current.save.tr,
          onTap: controller.onSave,
        ).width(double.infinity),
      ].toColumn().paddingAll(AppSpace.card),
    );
  }

  // 头像
  Widget _buildAvatar(BuildContext context) {
    return ListTileWidget(
      title: const TextWidget.label('头像'),
      trailing: [
        controller.filePhoto != null
            ? ImageWidget.img(
                controller.filePhoto?.path ?? "",
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
                radius: 25.w,
              )
            : ImageWidget.img(
                // UserService.to.profile.avatarUrl,
                "https://ducafecat-pub.oss-cn-qingdao.aliyuncs.com/avatar/00258VC3ly1gty0r05zh2j60ut0u0tce02.jpg",
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
                radius: 25.w,
              ),
      ],
      padding: EdgeInsets.all(AppSpace.card),
      // onTap: () => controller.onSelectPhoto(context),
      onTap: controller.onSelectPhoto,
    )
        .card(
          color: context.colors.scheme.surface,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        )
        .paddingBottom(AppSpace.card);
  }

  //  profile 表单
  Widget _buildProfileForm(BuildContext context) {
    return <Widget>[
      // first name
      TextFormWidget(
        controller: controller.firstNameController,
        labelText: S.current.first_name_iput_label,
        validator: Validatorless.multiple([
          Validatorless.required(S.of(context).validator_required),
          Validatorless.between(3, 18, S.of(context).validator_username),
        ]),
      ),

      // last name
      TextFormWidget(
        controller: controller.lastNameController,
        labelText: S.current.last_name_iput_label.tr,
        validator: Validatorless.multiple([
          Validatorless.required(S.of(context).validator_required),
          Validatorless.between(3, 18, S.of(context).validator_username),
        ]),
      ),

      // Email
      TextFormWidget(
        keyboardType: TextInputType.emailAddress,
        controller: controller.emailController,
        labelText: S.current.email_iput_label.tr,
        validator: Validatorless.multiple([
          Validatorless.required(S.current.validator_required.tr),
          Validatorless.email(S.current.validator_email.tr),
        ]),
      ),
      // end
    ]
        .toColumn()
        .paddingAll(AppSpace.card)
        .card(
          color: context.colors.scheme.surface,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        )
        .paddingBottom(AppSpace.card);
  }

  //  password 表单
  Widget _buildPasswordForm(BuildContext context) {
    return <Widget>[
      // old password
      TextFormWidget(
        isObscure: true,
        keyboardType: TextInputType.visiblePassword,
        controller: controller.oldPasswordController,
        labelText: S.current.edit_passowrd_old.tr,
        hintText: S.current.validator_skip.tr,
        validator: Validatorless.multiple([
          Validatorless.between(6, 18, S.of(context).validator_username),
        ]),
      ),

      // new password
      TextFormWidget(
        isObscure: true,
        keyboardType: TextInputType.visiblePassword,
        controller: controller.newPasswordController,
        labelText: S.current.edit_passowrd_old.tr,
        hintText: S.current.validator_skip.tr,
        validator: Validatorless.multiple([
          Validatorless.between(6, 18, S.of(context).validator_username),
        ]),
      ),

      // confirm password
      TextFormWidget(
        isObscure: true,
        keyboardType: TextInputType.visiblePassword,
        controller: controller.confirmNewPasswordController,
        labelText: S.current.edit_passowrd_new_confirm.tr,
        hintText: S.current.validator_skip.tr,
        validator: Validatorless.multiple([
          Validatorless.between(6, 18, S.of(context).validator_username),
        ]),
      ),

      // end
    ].toColumn().paddingAll(AppSpace.card).card(
          color: context.colors.scheme.surface,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        );
  }

  
}
