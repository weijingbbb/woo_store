class RouteNames {
  // static const String home = '/';
  // static const String details = '/details';

  static const systemMain = '/system_main'; // 系统金刚页
  static const systemHome = '/system_home'; // 系统主页
  static const systemSplash = '/system_splash'; // 系统启动页
  static const systemLogin = '/system_login'; // 登录页

  static const cartIndex = '/cart_index'; // 购物车页
  static const myIndex = '/my_index'; // 个人中心页

  // 不需要登录的路径
  static final noAuthPaths = [
    systemMain,
    systemSplash,
  ];
}
