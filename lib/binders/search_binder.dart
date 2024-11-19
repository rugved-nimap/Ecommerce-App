import 'package:ecommerce/controllers/search_page_controller.dart';
import 'package:get/get.dart';

class SearchBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SearchPageController(),
    );
  }
}
