import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/utils/index.dart';
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

}
