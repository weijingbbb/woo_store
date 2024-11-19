import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_store/components/index.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/widgets/index.dart';

import 'index.dart';
import 'widgets/welcome_slider.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(context),
      id: "welcome",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // slider切换
      _buildSlider(),
      // 控制栏
      _buildBar(),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        )
        .paddingAll(AppSpace.page);
  }

  Widget _buildSlider() {
    return GetBuilder<WelcomeController>(
      id: "slider",
      builder: (controller) {
        return WelcomeSliderWidget(
          controller.items,
          carouselController: controller.carouselController,
          onPageChanged: controller.onPageChanged,
        );
      },
    );
  }

  Widget _buildBar() {
    return GetBuilder<WelcomeController>(
        id: "bar",
        builder: (controller) {
          return controller.isShowStart
              ? ButtonWidget.primary(
                  S.current.start.tr,
                  onTap: controller.onToMain,
                ).tight(
                  width: double.infinity,
                )
              : <Widget>[
                  // 跳过
                  ButtonWidget.ghost(
                    S.current.skip.tr,
                    onTap: controller.onToMain,
                  ),
                  // 指示标
                  SliderIndicatorWidget(
                    length: controller.items.length,
                    currentIndex: controller.currentIndex,
                  ),
                  // 下一页
                  ButtonWidget.ghost(
                    S.current.next.tr,
                    onTap: controller.onNext,
                  ),
                ].toRow(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                );
        });
  }
}
