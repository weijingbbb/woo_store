import 'package:get/get.dart';

class ConfigService extends GetxController {
  static ConfigService get to => Get.find();

  // 是否首次打开
  // bool get isAlreadyOpen => StorageService.to.getBool(Constants.storageAlreadyOpen);

  // // 标记已打开app
  // void setAlreadyOpen() {
  //   StorageService.to.setBool(Constants.storageAlreadyOpen, true);
  // }
}
