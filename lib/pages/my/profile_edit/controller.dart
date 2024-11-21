import 'dart:io';

import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:woo_store/utils/index.dart';
import 'package:woo_store/widgets/index.dart';

class ProfileEditController extends GetxController {
  ProfileEditController(this.context);

  final BuildContext? context;

  // 本机图片file
  File? filePhoto;

  final List<AssetEntity> assets = [];

  // 显示图片选择弹窗
  void _showImagePickerDialog() async {
    // 检查相册权限
    var status = await Permission.photos.status;
    Console.log('相册权限状态一: ${status.toString()}');

    // 如果权限被拒绝，尝试请求权
    if (status.isDenied) {
      status = await Permission.photos.request();
    }

    Console.log('相册权限状态二: ${status.toString()}');

    if (context!.mounted) {
      // 如果权限仍然被拒绝，提示用户
      if (status == PermissionStatus.permanentlyDenied) {
        _showPermissionDeniedDialog();
        return;
      }
      final result = await AssetPicker.pickAssets(
        context!,
        pickerConfig: AssetPickerConfig(
          maxAssets: 1,
          selectedAssets: assets,
          requestType: RequestType.image,
        ),
      );
      if (result != null && result.isNotEmpty) {
        filePhoto = await result.first.file;
        update(["profile_edit"]);
        context!.pop();
      }
    }
  }

  // 显示权限被拒绝的提示对话框
  void _showPermissionDeniedDialog() {
    showDialog(
      context: context!,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('权限被拒绝'),
          content: const Text('请在设置中允许访问相册。'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
                // 打开应用设置
                openAppSettings();
              },
              child: const Text('去设置'),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('取消'),
            ),
          ],
        );
      },
    );
  }

  onSelectPhoto() {
    BottomSheetWidget.show(
      context: context!,
      titleString: '选择照片上传',
      padding: 20,
      content: <Widget>[
        // 拍照
        ButtonWidget.primary(
          '拍照',
          icon: IconWidget.icon(
            Icons.photo_camera,
            color: context!.colors.scheme.onPrimary,
          ),
          onTap: () {
            print('拍照');
          },
        ).marginSymmetric(vertical: 10),
        ButtonWidget.secondary(
          '从相册中选取',
          icon: IconWidget.icon(
            Icons.photo_library,
            color: context!.colors.scheme.onPrimary,
          ),
          onTap: () {
            _showImagePickerDialog();
          },
        ).marginOnly(bottom: 20),
        // 文字按钮
        ButtonWidget.ghost(
          '取消',
          onTap: () {
            context!.pop();
          },
        ),
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.stretch).center(),
    );
    // _showImagePickerDialog();
  }

  // 选择图片
  // onSelectPhoto(BuildContext context) {
  //   BottomSheetWidget.show(
  //     context: context,
  //     titleString: '选择照片上传',
  //     padding: 20,
  //     content: PickerImageWidget(
  //       ccc: context,
  //       // 拍照
  //       onTapTake: (AssetEntity? result) async {
  //         if (result != null) {
  //           filePhoto = await result.file;
  //           update(["profile_edit"]);
  //         }
  //       },
  //       // 相册
  //       onTapAlbum: (List<AssetEntity>? result) async {
  //         if (result != null && result.isNotEmpty) {
  //           filePhoto = await result.first.file;
  //           update(["profile_edit"]);
  //         }
  //       },
  //     ),
  //   );
  // }
}
