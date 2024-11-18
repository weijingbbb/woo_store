// 用户api
import 'package:woo_store/models/index.dart';
import 'package:woo_store/services/index.dart';
import 'package:woo_store/utils/index.dart';

class UserApi {
  /// 注册
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await NetworkService.to.post(
      '/users/register',
      data: req,
    );

    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }

  /// 登录
  static Future<UserTokenModel> login(UserLoginReq? req) async {
    var result = await NetworkService.to.post(
      '/users/login',
      data: req,
    );
    Console.log('登录结果: result: $result');

    return UserTokenModel.fromJson(result.data);
  }

  // 获取用户资料
  static Future<UserProfileModel> profile() async {
    var res = await NetworkService.to.get(
      '/users/me',
    );
    return UserProfileModel.fromJson(res.data);
  }
}
