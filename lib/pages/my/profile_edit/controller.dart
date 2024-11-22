import 'dart:io';

import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import 'package:woo_store/utils/index.dart';
import 'package:woo_store/widgets/index.dart';

class ProfileEditController extends GetxController {
  ProfileEditController(this.context);

  final BuildContext? context;

  // 本机图片file
  File? filePhoto;

  final List<AssetEntity> assets = [];

  // 点击选择图片按钮
  void _choicePhoto() async {
    // 检查相册权限
    var photosStatus = await Permission.photos.status;
    Console.log('相册权限状态一: ${photosStatus.toString()}');

    // 如果权限被拒绝，尝试请求权
    if (photosStatus.isDenied) {
      photosStatus = await Permission.photos.request();
    }

    Console.log('相册权限状态二: ${photosStatus.toString()}');

    if (context!.mounted) {
      // 如果权限仍然被拒绝，提示用户
      if (photosStatus == PermissionStatus.permanentlyDenied) {
        _showPermissionDeniedDialog(photosStatus);
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

  // 点击拍照按钮
  void _choiceCamera() async {
    // 请求权限
    var photosStatus = await Permission.photos.request();
    // 检查权限状态 如果有权限被拒绝，提示用户跳转到设置
    var cameraStatus = await Permission.camera.request();

    var microphoneStatus = await Permission.microphone.request();
    Console.log('''
      cameraStatus: $cameraStatus,
      cameraStatus.isGranted: ${cameraStatus.isGranted},
      ''');
    if (!microphoneStatus.isGranted) {
      return _showPermissionDeniedDialog(microphoneStatus);
    }
    if (!cameraStatus.isGranted) {
      return _showPermissionDeniedDialog(cameraStatus);
    }
    if (!photosStatus.isGranted) {
      return _showPermissionDeniedDialog(photosStatus);
    }
    Console.log('''
      microphoneStatus: $microphoneStatus,
      microphoneStatus.isGranted: ${microphoneStatus.isGranted},
      photosStatus: $photosStatus,
      photosStatus.isGranted: ${photosStatus.isGranted},
''');

    final AssetEntity? result = await CameraPicker.pickFromCamera(
      context!,
      pickerConfig: const CameraPickerConfig(
        // 关闭声音
        enableAudio: false,
        // 预设的分辨率
        resolutionPreset: ResolutionPreset.veryHigh,
      ),
    );

    if (result != null) {
      filePhoto = await result.file;
      update(["profile_edit"]);
      context!.pop();
    }
  }

  // 显示权限被拒绝的提示对话框
  void _showPermissionDeniedDialog(
      [PermissionStatus? cameraStatus,
      PermissionStatus? microphoneStatus,
      PermissionStatus? photosStatus]) {
    String message = '请在设置中允许访问以下权限：\n';
    if (cameraStatus != null) {
      message += '摄像头';
    }
    if (microphoneStatus != null) {
      message += '麦克风';
    }
    if (photosStatus != null) {
      message += '相册';
    }

    showDialog(
      context: context!,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('设备使用权限被拒绝'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
                // 打开应用设置
                openAppSettings();
              },
              child: const Text('去设置'),
            )
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
          onTap: _choiceCamera,
        ).marginSymmetric(vertical: 10),
        ButtonWidget.secondary(
          '从相册中选取',
          icon: IconWidget.icon(
            Icons.photo_library,
            color: context!.colors.scheme.onPrimary,
          ),
          onTap: _choicePhoto,
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
}