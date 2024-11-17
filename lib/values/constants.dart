/// 常量
class Constants {
  // wp 服务器
  static const netWorkApiBaseUrl = 'https://wpapi.ducafecat.tech';
  // 本地存储key
  static const storageLanguageCode = 'language_code';
  static const storageAlreadyOpen = 'already_open'; // 首次打开
  static const storageToken = 'token'; // 登录成功后 token
  static const storageProfile = 'profile'; // 用户资料缓存
  static const storageIsLogin = 'is_login'; // 是否登录
  static const storageThemeMode = 'theme_mode'; // 主题模式

  /// 自动主题
  static const String themeSystem = 'system';

  /// 亮色主题
  static const String themeLight = 'light';

  /// 暗色主题
  static const String themeDark = 'dark';

  // AES
  static const aesKey = 'aH5aH5bG0dC6aA3oN0cK4aU5jU6aK2lN';
  static const aesIV = 'hK6eB4aE1aF3gH5q';
}
