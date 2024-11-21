import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

/// 返回的授权状态
class PrivilegeStatus {
  final bool result;
  final String message;

  PrivilegeStatus({required this.result, required this.message});
}

class MyPrivilege {
  // 相册权限
  static Future<PrivilegeStatus> getPhotoPermission() async {
    var value = false;
    // 如果是 iOS 平台
    if (Platform.isIOS) {
      var statuses = await [Permission.photos].request();
      value = statuses[Permission.photos] == PermissionStatus.granted;
    }
    // 如果是 Android 平台
    if (Platform.isAndroid) {
      var statuses = await [Permission.storage].request();
      value = statuses[Permission.storage] == PermissionStatus.granted;
    }

    return PrivilegeStatus(
      result: value,
      message: value ? "允许访问相册" : "请设置允许访问相册/图库",
    );
  }

  // 跳转应用设置
  static Future<bool> openSettings() async {
    return await openAppSettings();
  }
}
