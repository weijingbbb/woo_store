import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/widgets/index.dart';

class RadioGroupFormFieldWidget<T> extends FormField<T> {
  RadioGroupFormFieldWidget({
    super.key,
    required this.items,
    this.initValue,
    this.labelText,
    this.tipText,
    this.onChanged,
    Function(T?)? validator,
  }) : super(
          initialValue: initValue,
          validator: (val) {
            if (validator != null) {
              return validator(val);
            }
            return null;
          },
          builder: (field) {
            void onChangedHandler(T value) {
              field.didChange(value);
              onChanged?.call(value);
            }

            return <Widget>[
              // 字段说明
              if (labelText != null)
                TextWidget.label(
                  labelText,
                ).paddingLeft(AppSpace.card),

              // 输入框
              RadioGroupWidget<T>(
                items: items,
                selectedValue: initValue,
                onChanged: onChangedHandler,
              ),

              // 提示词
              if (tipText != null)
                TextWidget.muted(
                  tipText,
                ).paddingLeft(AppSpace.card),

              // 错误提示
              if (field.errorText != null)
                TextWidget.muted(
                  field.errorText!,
                  color: field.context.colors.scheme.error,
                ).paddingLeft(AppSpace.card),
            ].toColumnSpace(
              crossAxisAlignment: CrossAxisAlignment.start,
            );
          },
        );

  /// 初始值
  final T? initValue;

  /// 字段文字
  final String? labelText;

  /// 提示词
  final String? tipText;

  /// 选项列表
  final List<RadioGroupModel<T>> items;

  /// 回调 [onChanged] 事件
  final Function(T?)? onChanged;

  @override
  RadioGroupFormWidgetFieldState<T> createState() =>
      RadioGroupFormWidgetFieldState<T>();
}

class RadioGroupFormWidgetFieldState<T> extends FormFieldState<T> {
  @override
  RadioGroupFormFieldWidget<T> get widget =>
      super.widget as RadioGroupFormFieldWidget<T>;

  // @override
  // void didChange(String? value) {
  //   super.didChange(value);
  // }
}
