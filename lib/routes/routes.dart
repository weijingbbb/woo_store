import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:woo_store/pages/index.dart';

import 'names.dart';
import 'observers.dart';

abstract class Routes {
  static final RouteObserver<Route> observer = RouteObservers();
  static final List<String> history = [];

  // 更新refresh，执行路由重定向，判断是否登录，未登录则跳转到登录页
  static final ValueNotifier<bool> refresh = ValueNotifier(false);

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
    redirect: _RouteRedirect.isLogin,
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
    ],
  );
}

abstract class _RouteRedirect {
  static String? isLogin(BuildContext context, GoRouterState state) {
    // Console.log('执行了auth方法---------------------');
    // if (Routes.noAuthPaths.contains(state.uri.toString())) return null;
    // if (UserService.to.isLogin) return null;
    // return '/${Routes.login}';
    return null;
  }

  // static String? isLogin(BuildContext context, GoRouterState state) {
  //   Console.log('执行了isLogin方法---------------------');
  //   // 如果已经登录，就跳转到首页
  //   if (UserService.to.isLogin) return '/${Routes.main}';
  //   return null;
  // }
}
