import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/global.dart';
import 'package:woo_store/routes/index.dart';
import 'package:woo_store/services/index.dart';
import 'package:woo_store/style/index.dart';

void main() {
  // 项目准备完毕
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Global.init().then((_) {
    Future.wait([
      Future.delayed(const Duration(seconds: 1)),
    ]).whenComplete(() {
      runApp(const MyApp());
      // 移除启动屏图片
      FlutterNativeSplash.remove();
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        return RefreshConfiguration(
            headerBuilder: () => const ClassicHeader(), // 自定义刷新头部
            footerBuilder: () => const ClassicFooter(), // 自定义刷新尾部
            headerTriggerDistance: 80, // 触发刷新的距离
            maxOverScrollExtent: 100, // 最大的拖动距离
            footerTriggerDistance: 150, // 触发加载的距离
            // ideFooterWhenNotFull: true, // 当列表不满一页时,是否隐藏刷新尾部
            child: _buildMaterialApp());
      },
    );
  }

  Widget _buildMaterialApp() {
    return GetBuilder<ConfigService>(builder: (_) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Woo Store',
        // 路由
        routerConfig: Routes.config,
        // 语言 - 翻译
        supportedLocales: S.delegate.supportedLocales,
        locale: LanguageService.to.locale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
        // 主题
        themeMode: AppTheme.mode,
        darkTheme: AppTheme.dark,
        theme: AppTheme.light,
        builder: (context, widget) {
          widget = EasyLoading.init()(context, widget); // EasyLoading 初始化

          // 不随系统字体缩放比例
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: widget,
          );
        },
      );
    });
  }
}
