import 'dart:convert';

import 'package:get/get.dart';
import 'package:woo_store/apis/index.dart';
import 'package:woo_store/models/index.dart';
import 'package:woo_store/pages/system/main/controller.dart';
import 'package:woo_store/routes/index.dart';
import 'package:woo_store/values/index.dart';

import 'storage.dart';

class UserService extends GetxController {
  static UserService get to => Get.find();

  // 是否登录
  bool _isLogin = false;

  // 用户令牌
  String _token = '';

  // 用户的资料
  UserProfileModel _profile = UserProfileModel();

  /// 是否登录
  bool get isLogin => _isLogin;

  /// 访问用户令牌
  String get token => _token;

  /// 用户的资料
  UserProfileModel get profile => _profile;

  /// 获取用户 profile
  Future<void> getProfile() async {
    if (_token.isEmpty) return;
    UserProfileModel result = await UserApi.profile();

    // 如果数据获取成功，更新数据，更新_isLogin
    await saveLoginStatus(true);
    await setProfile(result);
  }

  // 设置用户资料
  Future<void> setProfile(UserProfileModel newProfile) async {
    _profile = newProfile;
    StorageService.to
        .setString(Constants.storageProfile, jsonEncode(newProfile));
  }

  // 保存用户的token
  Future<void> saveToken(String newToken) async {
    _token = newToken;
    // 存储token
    await StorageService.to.setString(Constants.storageToken, _token);
  }

  // 保存登录状态到存储
  Future<void> saveLoginStatus(bool status) async {
    _isLogin = status;
    // 存储登录状态
    await StorageService.to.setBool(Constants.storageIsLogin, status);
    // 刷新路由
    // Routes.refresh.value = !Routes.refresh.value;
    // await Future.delayed(const Duration(microseconds: 0));
  }

  // 清除用户资料 - 退出登录
  void logout() async {
    await saveLoginStatus(false);
    await saveToken('');
    await setProfile(UserProfileModel());

    Routes.clearHistory();
    // Routes.refreshRoute();
    // 通过 Get 找到 MainController 并跳转到首页
    final MainController mainController = Get.find<MainController>();
    mainController.pageController.jumpToPage(0);
  }

  @override
  void onInit() {
    // 初始化时，读取存储中的登录状态、token
    _isLogin = StorageService.to.getBool(Constants.storageIsLogin);
    _token = StorageService.to.getString(Constants.storageToken);
    var profileOffline = StorageService.to.getString(Constants.storageProfile);
    if (profileOffline.isNotEmpty) {
      _profile = UserProfileModel.fromJson(jsonDecode(profileOffline));
    }

    super.onInit();
  }
}
