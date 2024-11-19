import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/models/index.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/utils/index.dart';
import 'package:woo_store/widgets/index.dart';

/// 商品列表
class BuildProductList extends StatelessWidget {
  const BuildProductList({
    super.key,
    required this.lineItems,
    this.currencySymbol,
  });

  /// 购物列表
  final List<LineItem> lineItems;

  /// 货币符号
  final String? currencySymbol;

  // 标题
  TableRow _tableHeader() {
    return TableRow(
      children: [
        const SizedBox(width: 50),
        TextWidget.label(S.current.order_detail_page_product.tr),
        TextWidget.label(S.current.order_detail_page_price_num.tr),
        TextWidget.label(S.current.order_detail_page_subtotal.tr),
      ],
    );
  }

  // 主视图
  Widget _buildView() {
    List<TableRow> ws = [];

    // 头部
    ws.add(_tableHeader());

    // 商品列表
    for (int i = 0; i < lineItems.length; i++) {
      LineItem item = lineItems[i];
      TableRow tr = TableRow(children: [
        // 编号
        TextWidget.muted("${i + 1}").alignCenter(),

        // 图 + 名称
        <Widget>[
          ImageWidget.img(
            Convert.aliImageResize(item.product?.images?[0].src ?? "",
                width: 140),
            width: 70.w,
            height: 70.w,
            radius: AppRadius.image,
          ),
          TextWidget.muted(item.product?.name ?? ""),
        ].toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        ),

        // 单价x数量
        TextWidget.muted(
          "${item.price} x ${item.quantity}",
        ),

        // 金额
        TextWidget.muted("$currencySymbol ${item.total}"),
      ]);
      ws.add(tr);
    }

    return Table(
      // 列宽
      columnWidths: const {
        0: FixedColumnWidth(50.0),
        2: FixedColumnWidth(100.0),
        3: FixedColumnWidth(80.0),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: ws,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
