import 'package:get/get.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProductDetailController(),
    );
  }
}
