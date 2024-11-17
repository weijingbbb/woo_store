import 'package:get/get.dart';
import 'package:woo_store/models/index.dart';
import 'package:woo_store/routes/index.dart';
import 'package:woo_store/values/index.dart';

import 'storage.dart';

class UserService extends GetxController {
  static UserService get to => Get.find();

  // 是否登录
  bool _isLogin = false;

  // 用户令牌
  String token = '';

  // 用户的资料
  final _profile = UserProfileModel();

  /// 是否登录
  bool get isLogin => _isLogin;

  /// 是否有令牌 token
  bool get hasToken => token.isNotEmpty;

  /// 用户的资料
  UserProfileModel get profile => _profile;

  // 获取用户资料
  void getProfile() {
    // 如果数据获取成功，更新数据，更新_isLogin
    saveLoginStatus(true);
  }

  // 设置用户资料
  void setProfile([UserProfileModel? profile]) {
    // _profile.assign(profile);
    saveLoginStatus(true);
  }

  // 清除用户资料 - 退出登录
  void clearProfile() {
    saveLoginStatus(false);
  }

  // 保存登录状态到存储
  void saveLoginStatus(bool status) {
    _isLogin = status;
    // 存储登录状态
    StorageService.to.setBool(Constants.storageIsLogin, status);
    Routes.refresh.value = !Routes.refresh.value;
  }

  @override
  void onInit() {
    // 初始化时，读取存储中的登录状态
    _isLogin = StorageService.to.getBool(Constants.storageIsLogin);
    super.onInit();
  }
}
