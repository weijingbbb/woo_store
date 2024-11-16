import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class CartIndexPage extends GetView<CartIndexController> {
  const CartIndexPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("购物车主页"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartIndexController>(
      init: CartIndexController(),
      id: "index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("index")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
