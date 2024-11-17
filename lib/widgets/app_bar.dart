import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:woo_store/style/index.dart';

/// AppBar 导航栏
class AppBarWidget extends AppBar {
  AppBarWidget({
    super.key,
    super.automaticallyImplyLeading,
    super.title,
    List<Widget>? actions,
    super.centerTitle,
    super.titleSpacing,
    super.backgroundColor,
    super.systemOverlayStyle,
  }) : super(
          actions: _buildActions(actions),
        );

  static List<Widget>? _buildActions(List<Widget>? items) {
    if ((items ?? []).isEmpty) return null;
    final ws = <Widget>[];
    for (var element in items!) {
      ws.add(element
          .padding(
            all: AppSpace.appbar,
          )
          .center());
    }
    return ws;
  }
}
