import 'package:get/get.dart';
import 'package:woo_store/models/index.dart';

class OrderDetailController extends GetxController {
  OrderDetailController(this.order);

  final OrderModel order;

  _initData() {
    update(["order_detail"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
