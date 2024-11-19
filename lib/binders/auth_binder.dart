
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }

}