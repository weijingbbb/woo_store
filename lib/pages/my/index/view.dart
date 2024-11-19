import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/routes/index.dart';
import 'package:woo_store/services/index.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/utils/index.dart';
import 'package:woo_store/values/index.dart';
import 'package:woo_store/widgets/index.dart';

import 'index.dart';
import 'widgets/bar_item.dart';
import 'widgets/button_item.dart';

class MyIndexPage extends GetView<MyIndexController> {
  const MyIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyIndexController>(
      init: MyIndexController(),
      id: "index",
      builder: (_) {
        return Scaffold(
          body: _buildView(context),
        );
      },
    );
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    final version = ConfigService.to.version;
    return CustomScrollView(
      slivers: <Widget>[
        // 顶部 APP 导航栏
        _buildAppBar(context),
        // 我的订单
        _buildMyOrder(context),
        // 按钮列表
        _buildButtonsList(context),
        // 注销
        ButtonWidget.primary(
          S.current.my_page_logout.tr,
          // height: 60,
          onTap: () => {
            // 打印版本
            Console.log("版本号: $version"),
          },
        )
            .padding(
              left: AppSpace.page,
              right: AppSpace.page,
              bottom: AppSpace.listRow * 2,
            )
            .sliverBox,
        // 版本号
        if (version.isNotEmpty)
          TextWidget.label(
            "${S.current.current_version.tr}：v $version",
          ).alignCenter().paddingBottom(200).sliverBox,
        // sliverBox 允许您在CustomScrollView中插入小部件
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
        // 背景色
        backgroundColor: Colors.transparent,
        // 固定在顶部
        pinned: true,
        // 浮动在顶部
        floating: true,
        // 自动弹性显示
        snap: true,
        // 是否应拉伸以填充过度滚动区域。
        stretch: true,
        // 高度
        expandedHeight: 280.h,
        // 此小组件堆叠在工具栏和选项卡栏后面。其高度将与应用栏的整体高度相同。
        flexibleSpace: FlexibleSpaceBar(
          // 背景
          background: <Widget>[
            // 背景图
            <Widget>[
              IconWidget.svg(
                AssetsSvgs.profileHeaderBackgroundSvg,
                color: context.colors.scheme.primary,
                fit: BoxFit.cover,
              ).expanded(),
            ].toColumn(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            ),

            // 内容
            <Widget>[
              // 用户信息
              <Widget>[
                // 头像
                ImageWidget.img(
                  // 测试需要改成自定义头像
                  "https://ducafecat-pub.oss-cn-qingdao.aliyuncs.com/avatar/00258VC3ly1gty0r05zh2j60ut0u0tce02.jpg",
                  width: 100.w,
                  height: 100.w,
                  fit: BoxFit.fill,
                  radius: 50.w,
                ).paddingRight(AppSpace.listItem),

                // 称呼
                TextWidget.h2(
                  "${UserService.to.profile.username}",
                  color: context.colors.scheme.onPrimary,
                ),
              ].toRow().paddingHorizontal(AppSpace.card),

              // 功能栏位
              <Widget>[
                // 1
                BarItemWidget(
                  title: S.current.my_page_likes.tr,
                  svgPath: AssetsSvgs.iLikeSvg,
                ),
                // 2
                BarItemWidget(
                  title: S.current.my_page_favorites.tr,
                  svgPath: AssetsSvgs.iAddFriendSvg,
                ),
                // 3
                BarItemWidget(
                  title: S.current.my_page_receipt.tr,
                  svgPath: AssetsSvgs.iCouponSvg,
                ),
              ]
                  .toRow(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  )
                  .paddingSymmetric(
                    horizontal: AppSpace.card,
                    vertical: AppSpace.card * 2,
                  )
                  .card(
                    color: context.colors.scheme.surface,
                  )
                  .paddingHorizontal(AppSpace.page),
            ].toColumn(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ].toStack(),
        ));
  }

  Widget _buildMyOrder(BuildContext context) {
    return ButtonItemWidget(
      title: S.current.my_page_orders.tr,
      svgPath: AssetsSvgs.pDeliverySvg,
      color: context.colors.scheme.primary,
      onTap: () => {Console.log("我的订单")},
    ).height(70.h).elevation(2).paddingVertical(AppSpace.page).sliverBox;
  }

  // 按钮列表
  Widget _buildButtonsList(BuildContext context) {
    return <Widget>[
      // 个人资料
      ButtonItemWidget(
        title: S.current.my_page_personal_data.tr,
        svgPath: AssetsSvgs.pCurrencySvg,
        color: "4971FF".toColor,
        onTap: () => {},
      ),
      // 发票地址
      ButtonItemWidget(
        title: S.current.my_page_invoice_address.tr,
        svgPath: AssetsSvgs.pHomeSvg,
        color: "F43284".toColor,
        onTap: () => {},
      ),
      // 收货地址
      ButtonItemWidget(
        title: S.current.my_page_shipping_address.tr,
        svgPath: AssetsSvgs.pHomeSvg,
        color: "5F84FF".toColor,
        onTap: () => {},
      ),
      // 语言
      ButtonItemWidget(
        title: S.current.my_page_language.tr,
        svgPath: AssetsSvgs.pTranslateSvg,
        color: "41AA3D".toColor,
        onTap: () => context.pushNamed(RouteNames.myLanguage),
      ),
      // 主题
      ButtonItemWidget(
        title: S.current.my_page_theme.tr,
        svgPath: AssetsSvgs.pThemeSvg,
        color: "F89C52".toColor,
        onTap: () => context.pushNamed(RouteNames.myTheme),
      ),
    ]
        .toColumnSpace()
        .paddingVertical(10)
        .backgroundColor(context.colors.scheme.surface)
        .elevation(2)
        .paddingBottom(30.h)
        .sliverBox;
  }
}
