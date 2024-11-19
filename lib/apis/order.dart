import 'package:woo_store/models/index.dart';
import 'package:woo_store/services/index.dart';

/// 商品 api
class OrderApi {
  /// 订单列表
  static Future<List<OrderModel>> orders(OrdersReq req) async {
    var res = await NetworkService.to.get(
      '/orders',
      params: req.toJson(),
    );

    List<OrderModel> orders = [];
    for (var item in res.data) {
      orders.add(OrderModel.fromJson(item));
    }
    return orders;
  }
}
