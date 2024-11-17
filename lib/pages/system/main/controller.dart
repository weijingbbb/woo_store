import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MainController extends GetxController {
  MainController();

  late final PageController pageController;
  int currentPage = 0;

  void changePage(int page) {
    // Console.log(page);
    currentPage = page;
    update(['navigation']);
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPage);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
