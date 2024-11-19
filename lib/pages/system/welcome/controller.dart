import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/models/index.dart';
import 'package:woo_store/routes/index.dart';
import 'package:woo_store/services/index.dart';
import 'package:woo_store/values/index.dart';

class WelcomeController extends GetxController {
  WelcomeController(this.context);

  final BuildContext context;

  final CarouselSliderController carouselController =
      CarouselSliderController();

  int currentIndex = 1;
  bool isShowStart = false;

  List<WelcomeModel> items = [
    WelcomeModel(
      image: AssetsImages.welcome_1Png,
      title: S.current.welcomeOneTitle.tr,
      desc: S.current.welcomeOneDesc.tr,
    ),
    WelcomeModel(
      image: AssetsImages.welcome_2Png,
      title: S.current.welcomeTwoTitle.tr,
      desc: S.current.welcomeTwoDesc.tr,
    ),
    WelcomeModel(
      image: AssetsImages.welcome_3Png,
      title: S.current.welcomeThreeTitle.tr,
      desc: S.current.welcomeThreeDesc.tr,
    ),
  ];

  // 当前位置发生改变
  void onPageChanged(int index) {
    currentIndex = index;
    isShowStart = currentIndex == 2;
    update(['slider', 'bar']);
  }

  void onToMain() {
    if (context.mounted) {
      context.replaceNamed(RouteNames.systemMain);
    }
  }

  void onNext() {
    carouselController.nextPage();
  }

  @override
  void onReady() {
    super.onReady();
    // 设置首次打开
    ConfigService().setAlreadyOpen();
  }
}
