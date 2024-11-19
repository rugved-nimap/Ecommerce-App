
import 'package:get/get.dart';

class AuthController extends GetxController {

  bool isObscure = true;

  void changeObscure() {
    isObscure = !isObscure;
    update();
  }
}