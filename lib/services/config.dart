import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:woo_store/utils/index.dart';
import 'package:woo_store/values/index.dart';

import 'storage.dart';

class ConfigService extends GetxController {
  static ConfigService get to => Get.find();

  // 版号
  PackageInfo? _platform;

  // 版本号
  String get version => _platform?.version ?? '';

  // 是否首次打开
  bool get isAlreadyOpen =>
      StorageService.to.getBool(Constants.storageAlreadyOpen);

  // 标记首次打开app
  void setAlreadyOpen() {
    StorageService.to.setBool(Constants.storageAlreadyOpen, true);
  }

  // 初始
  Future<void> init() async {
    _platform = await PackageInfo.fromPlatform();
    Console.log('初始化ConfigService，当前版本号: ${_platform?.version}');
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }
}
