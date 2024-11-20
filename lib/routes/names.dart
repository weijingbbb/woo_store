class RouteNames {
  // static const String home = '/';
  // static const String details = '/details';

  static const systemMain = '/system_main'; // 系统金刚页
  static const systemHome = '/system_home'; // 系统主页
  static const systemSplash = '/system_splash'; // 系统启动页
  static const systemWelcome = '/system_welcome'; // 系统欢迎页
  static const systemLogin = '/system_login'; // 登录页
  static const systemRegister = '/register'; // 注册页
  static const systemRegisterPin = '/register_pin'; // 注册页 - 验证码

  static const cartIndex = '/cart_index'; // 购物车页
  static const myIndex = '/my_index'; // 个人中心页
  static const myTheme = '/my_theme'; // 个人资料页
  static const myLanguage = '/my_language'; // 语言设置页
  static const myOrderList = '/my_order_list'; // 订单列表页
  static const myOrderDetail = '/my_order_detail'; // 订单详情页

  // 不需要登录的路径
  static final noAuthPaths = [
    '/',
    systemMain,
    systemSplash,
    systemWelcome,
    systemLogin,
    systemHome,
    systemRegister,
    systemRegisterPin,
  ];
}
