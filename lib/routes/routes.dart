import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:woo_store/models/index.dart';
import 'package:woo_store/pages/index.dart';
import 'package:woo_store/services/index.dart';
import 'package:woo_store/utils/index.dart';

import 'names.dart';
import 'observers.dart';

abstract class Routes {
  static final RouteObserver<Route> observer = RouteObservers();
  static final List<String> history = [];

  // 更新refresh，执行路由重定向，判断是否登录，未登录则跳转到登录页
  static final ValueNotifier<bool> refresh = ValueNotifier(false);

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
    initialLocation: RouteNames.systemMain,
    redirect: _RouteRedirect.auth,
    refreshListenable: refresh,
    routes: [
      ...tarbarPage,
      GoRoute(
        path: RouteNames.systemMain,
        name: RouteNames.systemMain,
        pageBuilder: (context, state) => CupertinoPage(
          name: state.uri.toString(),
          key: state.pageKey,
          child: const MainPage(),
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
        redirect: _RouteRedirect.isLoginPage,
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
    ],
  );
}

abstract class _RouteRedirect {
  static String? auth(BuildContext context, GoRouterState state) {
    final to = state.uri.toString();
    Console.log('登录鉴权：$to,---${RouteNames.noAuthPaths.contains(to)}');
    if (RouteNames.noAuthPaths.contains(to)) {
      return null;
    }
    if (UserService.to.isLogin) return null;

    return RouteNames.systemLogin;
  }

  static String? isLoginPage(BuildContext context, GoRouterState state) {
    // Console.log('isLoginPage------------${UserService.to.isLogin}');
    // 如果已经登录，就跳转到首页
    if (UserService.to.isLogin) {
      return RouteNames.systemMain;
      // 如果历史记录列表中倒数第二个元素不是首页，就跳转到这个页面，否则跳转到首页
      // if (Routes.history.length > 1 &&
      //     Routes.history[Routes.history.length - 2] != RouteNames.systemMain) {
      //   return Routes.history[Routes.history.length - 2];
      // }
      // return RouteNames.systemMain;
    }
    return null;
  }
}
