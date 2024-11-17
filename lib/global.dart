import 'package:get/get.dart';
import 'package:woo_store/services/index.dart';

class Global {
  // 初始化
  static Future<void> init() async {
    // 初始化全局变量
    await Future.wait([
      // 初始化主要的服务

      // 初始化存储服务
      Get.putAsync<StorageService>(() => StorageService().init()),
    ]).whenComplete(() {
      // 初始化后置的服务
      Get.put<ConfigService>(ConfigService());
      // 用户数据服务
      Get.put<UserService>(UserService());
    });
  }
}
