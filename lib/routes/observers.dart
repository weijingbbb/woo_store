import 'package:flutter/material.dart';

import 'routes.dart';

/// 记录路由的变化
class RouteObservers<R extends Route<dynamic>> extends RouteObserver<R> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    var name = route.settings.name ?? '';
    if (name.isNotEmpty) Routes.history.add(name);
    debugPrint('路由推入,${Routes.history.toString()}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    Routes.history.remove(route.settings.name);
    debugPrint('路由推出,${Routes.history.toString()}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      var index = Routes.history.indexWhere((element) {
        return element == oldRoute?.settings.name;
      });
      var name = newRoute.settings.name ?? '';
      if (name.isNotEmpty) {
        if (index > 0) {
          Routes.history[index] = name;
        } else {
          Routes.history.add(name);
        }
      }
    }
    debugPrint('路由替换,${Routes.history.toString()}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    Routes.history.remove(route.settings.name);
    debugPrint('移除路由,${Routes.history.toString()}');
  }
}
