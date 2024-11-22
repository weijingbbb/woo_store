import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:woo_store/models/index.dart';
import 'package:woo_store/pages/index.dart';
import 'package:woo_store/pages/my/profile_edit/view.dart';
import 'package:woo_store/services/index.dart';
import 'package:woo_store/utils/index.dart';

import 'names.dart';
import 'observers.dart';

abstract class Routes {
  static final RouteObserver<Route> observer = RouteObservers();
  static final List<String> history = [];

  // 更新refresh，执行路由重定向，判断是否登录，未登录则跳转到登录页
  static final ValueNotifier<String> refresh = ValueNotifier(const Uuid().v4());

  // 更新refresh，执行路由重定向
  static void refreshRoute() {
    // 旧值 const Uuid().v4()
    final old = refresh.value;
    // 新值
    final id = const Uuid().v4();
    refresh.value = id;
    print('刷新路由,新值：$id，旧值：$old');
  }

  // 清空历史记录
  static void clearHistory() {
    history.clear();
  }

  // tarbar 底部导航
  static final tarbarPage = [
    GoRoute(
      path: RouteNames.systemHome,
      name: RouteNames.systemHome,
      pageBuilder: (context, state) => CupertinoPage(
        name: state.uri.toString(),
        key: state.pageKey,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: RouteNames.cartIndex,
      name: RouteNames.cartIndex,
      pageBuilder: (context, state) => CupertinoPage(
        name: state.uri.toString(),
        key: state.pageKey,
        child: const CartIndexPage(),
      ),
    ),
    GoRoute(
      path: RouteNames.myIndex,
      name: RouteNames.myIndex,
      pageBuilder: (context, state) => CupertinoPage(
        name: state.uri.toString(),
        key: state.pageKey,
        child: const MyIndexPage(),
      ),
    ),
  ];

  static final config = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    observers: [observer],
    initialLocation: '/',
    redirect: _RouteRedirect.auth,
    refreshListenable: refresh,
    routes: [
      ...tarbarPage,
      GoRoute(
        path: '/',
        name: RouteNames.systemMain,
        pageBuilder: (context, state) => CupertinoPage(
          name: state.uri.toString(),
          key: state.pageKey,
          child: const MainPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.systemSplash,
        name: RouteNames.systemSplash,
        pageBuilder: (context, state) => CupertinoPage(
          name: state.uri.toString(),
          key: state.pageKey,
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.systemWelcome,
        name: RouteNames.systemWelcome,
        pageBuilder: (context, state) => CupertinoPage(
          name: state.uri.toString(),
          key: state.pageKey,
          child: const WelcomePage(),
        ),
      ),
      GoRoute(
        path: RouteNames.systemLogin,
        name: RouteNames.systemLogin,
        pageBuilder: (context, state) => CupertinoPage(
          name: state.uri.toString(),
          key: state.pageKey,
          child: const LoginPage(),
        ),
        // redirect: _RouteRedirect.isLoginPage,
      ),
      GoRoute(
        path: RouteNames.systemRegister,
        name: RouteNames.systemRegister,
        pageBuilder: (context, state) => CupertinoPage(
          name: state.uri.toString(),
          key: state.pageKey,
          child: const RegisterPage(),
        ),
      ),
      GoRoute(
          path: RouteNames.systemRegisterPin,
          name: RouteNames.systemRegisterPin,
          pageBuilder: (context, state) {
            final req = state.extra;
            Console.log('req-------:$req');
            return CupertinoPage(
                name: state.uri.toString(),
                key: state.pageKey,
                child: RegisterPinPage(
                  singupReq: state.extra as UserRegisterReq,
                ));
          }),
      GoRoute(
        path: RouteNames.myTheme,
        name: RouteNames.myTheme,
        pageBuilder: (context, state) => CupertinoPage(
          name: state.uri.toString(),
          key: state.pageKey,
          child: const ThemePage(),
        ),
      ),
      GoRoute(
        path: RouteNames.myLanguage,
        name: RouteNames.myLanguage,
        pageBuilder: (context, state) => CupertinoPage(
          name: state.uri.toString(),
          key: state.pageKey,
          child: const LanguagePage(),
        ),
      ),
      GoRoute(
        path: RouteNames.myOrderList,
        name: RouteNames.myOrderList,
        pageBuilder: (context, state) => CupertinoPage(
          name: state.uri.toString(),
          key: state.pageKey,
          child: const OrderListPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.myOrderDetail,
        name: RouteNames.myOrderDetail,
        pageBuilder: (context, state) => CupertinoPage(
          name: state.uri.toString(),
          key: state.pageKey,
          child: OrderDetailPage(order: state.extra as OrderModel),
        ),
      ),
      GoRoute(
        path: RouteNames.myProfileEdit,
        name: RouteNames.myProfileEdit,
        pageBuilder: (context, state) => CupertinoPage(
          name: state.uri.toString(),
          key: state.pageKey,
          child: const ProfileEditPage(),
        ),
      ),
    ],
  );
}

abstract class _RouteRedirect {
  static String? auth(BuildContext context, GoRouterState state) {
    final to = state.matchedLocation;
    final noAuthPath = RouteNames.noAuthPaths.contains(to);
    print(
        '当前准备进入页面：$to,---是否无需登录：$noAuthPath,---登录状态：${UserService.to.isLogin},---栈：${Routes.history.toString()}');

    // 当退出登录时，上一个页面是权限页面，就跳转到首页

    if (noAuthPath) {
      return null;
    }
    if (!UserService.to.isLogin) {
      return RouteNames.systemLogin;
    }
    return null;
  }

  static String? isLoginPage(BuildContext context, GoRouterState state) {
    print('当前是登录页-------------------');
    // 如果已经登录，就跳转到首页, 并且当前是登录页，就跳转到首页
    if (UserService.to.isLogin) {
      return RouteNames.systemMain;
    }
    return null;
  }
}
