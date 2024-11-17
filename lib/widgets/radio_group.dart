import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:woo_store/widgets/index.dart';

/// RadioGroup Model
class RadioGroupModel<T> {
  final String title;
  final T value;

  RadioGroupModel({
    required this.title,
    required this.value,
  });
}

/// RadioGroup 组件
class RadioGroupWidget<T> extends StatefulWidget {
  const RadioGroupWidget({
    super.key,
    required this.items,
    this.selectedValue,
    this.onChanged,
  });

  /// 数据列表
  final List<RadioGroupModel<T>> items;

  /// 选中数据值
  final T? selectedValue;

  /// 选中回调
  final Function(T)? onChanged;

  @override
  State<RadioGroupWidget<T>> createState() => _RadioGroupWidgetState<T>();
}

class _RadioGroupWidgetState<T> extends State<RadioGroupWidget<T>> {
  late T? _selectedValue;

  @override
  void initState() {
    _selectedValue = widget.selectedValue; //?? widget.items.first.value;
    super.initState();
  }

  Widget _buildItem(RadioGroupModel item) {
    return <Widget>[
      // 图标按钮
      Icon(
        _selectedValue == item.value
            ? Icons.radio_button_checked
            : Icons.radio_button_off,
        color: context.colors.scheme.onSurface.withOpacity(0.8),
      ),

      // 标题
      TextWidget.label(item.title).expanded(),
    ]
        .toRowSpace(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
    )
        .gestures(onTap: () {
      setState(() {
        _selectedValue = item.value;
        widget.onChanged?.call(_selectedValue as T);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> ws = [];

    for (var item in widget.items) {
      ws.add(
        _buildItem(item),
      );
    }

    return ws.toColumnSpace(
      mainAxisSize: MainAxisSize.min,
    );
  }
}
