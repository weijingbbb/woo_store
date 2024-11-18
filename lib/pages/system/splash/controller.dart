import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:woo_store/routes/index.dart';
import 'package:woo_store/services/index.dart';

class SplashController extends GetxController {
  SplashController(this.context);

  final BuildContext context;

  // 如果是第一次打开app，跳转到welcome页面，否则跳转到main页面
  void _jumpToPage() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      if (ConfigService.to.isAlreadyOpen) {
        if (context.mounted) {
          context.goNamed(RouteNames.systemMain);
        }
      } else {
        if (context.mounted) {
          context.goNamed(RouteNames.systemWelcome);
        }
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    _jumpToPage();
  }
}
