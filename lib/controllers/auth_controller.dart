import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../binders/home_binder.dart';
import '../pages/home.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isObscure = true;
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPas = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController signupPass = TextEditingController();

  void changeObscure() {
    isObscure = !isObscure;
    update();
  }

  Future<void> login() async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: loginEmail.text,
        password: loginPas.text,
      )
          .then(
        (value) {
          Get.snackbar(
            "Account Login Successfully",
            "Email: ${value.user?.email}\nUID: ${value.user?.uid}",
            duration: const Duration(seconds: 1),
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            isDismissible: false,
            icon: const Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.white,
            ),
          );
          Get.to(const Home(), binding: HomeBinder());
        },
      );
    } catch (e) {
      Get.snackbar("Error Login !!", "$e");
    }
  }

  Future<void> signup() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: signupEmail.text,
        password: signupPass.text,
      )
          .then(
        (value) {
          Get.snackbar(
            "Account Created Successfully",
            "Email: ${value.user?.email}\nUID: ${value.user?.uid}",
            duration: const Duration(seconds: 1),
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            isDismissible: false,
            icon: const Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.white,
            ),
          );
          Get.to(const Home(), binding: HomeBinder());
        },
      );
    } catch (e) {
      Get.snackbar("Error Creating an Account !!", "$e");
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
