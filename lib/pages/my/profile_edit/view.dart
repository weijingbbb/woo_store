import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/utils/index.dart';
import 'package:woo_store/widgets/index.dart';

import 'index.dart';

class ProfileEditPage extends GetView<ProfileEditController> {
  ProfileEditPage({super.key});

  final List<AssetEntity> assets = [];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileEditController>(
      init: ProfileEditController(),
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
      onTap: () => _showImagePickerDialog(context),
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

  // 显示图片选择弹窗
  void _showImagePickerDialog(BuildContext context) async {
    // 检查相册权限
    var status = await Permission.photos.status;
    Console.log('相册权限状态一: ${status.toString()}');

    // 如果权限被拒绝，尝试请求权
    if (status.isDenied) {
      status = await Permission.photos.request();
    }

    Console.log('相册权限状态二: ${status.toString()}');

    if (context.mounted) {
      // 如果权限仍然被拒绝，提示用户
      if (status == PermissionStatus.permanentlyDenied) {
        _showPermissionDeniedDialog(context);
        return;
      }
      final result = await AssetPicker.pickAssets(
        context,
        pickerConfig: AssetPickerConfig(
          maxAssets: 9,
          selectedAssets: assets,
        ),
      );
      Console.log(result);
    }
  }

  // 显示权限被拒绝的提示对话框
  void _showPermissionDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('权限被拒绝'),
          content: const Text('请在设置中允许访问相册。'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // 这里可以选择打开应用设置
                openAppSettings();
              },
              child: const Text('去设置'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('取消'),
            ),
          ],
        );
      },
    );
  }
}
