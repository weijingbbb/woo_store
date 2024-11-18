import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_store/values/index.dart';
import 'package:woo_store/widgets/index.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(context),
      id: "splash",
      builder: (_) {
        return const ImageWidget.img(
          AssetsImages.splashJpg,
          fit: BoxFit.fill, // 填充整个界面
        );
      },
    );
  }
}
