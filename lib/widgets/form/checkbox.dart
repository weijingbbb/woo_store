import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/widgets/index.dart';

class CheckboxFormFieldWidget extends FormField<bool> {
  CheckboxFormFieldWidget({
    super.key,
    this.initValue,
    this.title,
    this.description,
    this.onChanged,
    Function(bool?)? validator,
  }) : super(
          initialValue: initValue,
          validator: (val) {
            if (validator != null) {
              return validator(val);
            }
            return null;
          },
          builder: (field) {
            void onChangedHandler(bool? value) {
              field.didChange(value);
              onChanged?.call(value);
            }

            return <Widget>[
              // 选项
              CheckboxWidget(
                checked: field.value,
                title: title,
                description: description,
                onChanged: onChangedHandler,
              ),

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
  final bool? initValue;

  /// 标题
  final String? title;

  /// 说明
  final String? description;

  /// 回调 [onChanged] 事件
  final Function(bool?)? onChanged;

  @override
  CheckboxFormFieldWidgetState createState() => CheckboxFormFieldWidgetState();
}

class CheckboxFormFieldWidgetState extends FormFieldState<bool> {
  @override
  CheckboxFormFieldWidget get widget => super.widget as CheckboxFormFieldWidget;
}
