import 'package:get/get.dart';
import 'package:woo_store/values/index.dart';

import 'storage.dart';

class ConfigService extends GetxController {
  static ConfigService get to => Get.find();

  // 是否首次打开
  bool get isAlreadyOpen =>
      StorageService.to.getBool(Constants.storageAlreadyOpen);

  // 标记首次打开app
  void setAlreadyOpen() {
    StorageService.to.setBool(Constants.storageAlreadyOpen, true);
  }
}
