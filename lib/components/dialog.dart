import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/widgets/index.dart';

/// 对话框
class ActionDialog {
  static Future normal({
    required BuildContext context,
    Widget? title, // 标题
    Widget? content, // 内容
    Widget? confirm, // 确认按钮
    Widget? cancel, // 取消按钮
    Color? confirmBackgroundColor, // 确认按钮背景色
    Function()? onConfirm, // 确认按钮回调
    Function()? onCancel, // 取消按钮回调
  }) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(AppSpace.card),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // 标题
                title != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: title,
                      )
                    : Container(),
                // DefaultTextStyle(
                //   textAlign: TextAlign.center,
                //   style: const TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //     // color: AppColors.onPrimary,
                //   ),
                //   child: title != null
                //       ? Padding(
                //           padding: const EdgeInsets.only(top: 4),
                //           child: title,
                //         )
                //       : Container(),
                // ),

                // 内容
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: content ?? const Text('默认的内容'),
                  // child: DefaultTextStyle(
                  //   textAlign: TextAlign.center,
                  //   style: const TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //     // color: AppColors.onPrimary,
                  //   ),
                  //   child: content ?? Text(LocaleKeys.commonBottomRemove.tr),
                  // ),
                ),
                SizedBox(height: AppSpace.listRow),

                // 取消 确认
                Row(
                  children: [
                    Expanded(
                      child: ButtonWidget.secondary(
                        S.current.cancel.tr,
                        onTap: () {
                          // Get.back(closeOverlays: true);
                          context.pop();
                          if (onCancel != null) onCancel();
                        },
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ButtonWidget.primary(
                        S.current.confirm.tr,
                        onTap: () {
                          // Get.back(closeOverlays: true);
                          context.pop();
                          if (onConfirm != null) onConfirm();
                        },
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
