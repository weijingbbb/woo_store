import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/pages/index.dart';
import 'package:woo_store/routes/index.dart';
import 'package:woo_store/services/index.dart';
import 'package:woo_store/values/index.dart';

import 'widgets/navigation.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (_) {
        return PopScope(
          // 禁止返回
          canPop: false,
          child: Scaffold(
            extendBody: true,
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              onPageChanged: controller.changePage,
              children: const [HomePage(), CartIndexPage(), MyIndexPage()],
            ),
            // 导航栏
            bottomNavigationBar: GetBuilder<MainController>(
              id: 'navigation',
              builder: (controller) {
                return BuildNavigation(
                  currentIndex: controller.currentPage,
                  items: [
                    NavigationItemModel(
                      label: S.of(context).navigation_home,
                      icon: AssetsSvgs.navHomeSvg,
                    ),
                    NavigationItemModel(
                      label: S.of(context).navigation_cart,
                      icon: AssetsSvgs.navCartSvg,
                      // 购物车数量
                      // count: CartService.to.lineItemsCount,
                    ),
                    // NavigationItemModel(
                    //   label: LocaleKeys.tabBarMessage.tr,
                    //   icon: AssetsSvgs.navMessageSvg,
                    //   count: 1,
                    // ),
                    NavigationItemModel(
                      label: S.of(context).navigation_profile,
                      icon: AssetsSvgs.navProfileSvg,
                    ),
                  ],
                  onTap: (index) {
                    if (index > 0 && !UserService.to.isLogin) {
                      context.pushNamed(RouteNames.systemLogin);
                    } else {
                      controller.pageController.jumpToPage(index);
                    }
                  }, // 切换tab事件
                );
              },
            ),
          ),
        );
      },
    );
  }

  Future<bool?> _showBackDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('确认退出吗?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('返回'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('退出'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }
}
