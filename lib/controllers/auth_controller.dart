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
          Get.showSnackbar(
            GetSnackBar(
              titleText: const Text(
                "User has Successfully Login",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              margin: const EdgeInsets.all(10),
              borderRadius: 20,
              borderWidth: 2,
              borderColor: Colors.white,
              message: "Welcome! ${_auth.currentUser?.displayName}",
              snackStyle: SnackStyle.FLOATING,
              duration: const Duration(seconds: 1),
              // backgroundColor: Colors.green,
              snackPosition: SnackPosition.BOTTOM,
              backgroundGradient: LinearGradient(
                colors: [Colors.lightGreen, Colors.green.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              isDismissible: false,
              icon: const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.white,
              ),
            ),
          );
          Get.to(const Home(), binding: HomeBinder());
        },
      );
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          titleText: const Text(
            "Couldn't Login to Account !!",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          message: "$e",
          margin: const EdgeInsets.all(10),
          borderRadius: 20,
          borderWidth: 2,
          borderColor: Colors.white,
          snackStyle: SnackStyle.FLOATING,
          duration: const Duration(seconds: 1),
          // backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          backgroundGradient: LinearGradient(
            colors: [Colors.red, Colors.red.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          isDismissible: false,
          icon: const Icon(
            Icons.warning_amber_rounded,
            size: 40,
            color: Colors.amber,
          ),
        ),
      );
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
          Get.showSnackbar(
            GetSnackBar(
              titleText: const Text(
                "Account Created Successfully",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              margin: const EdgeInsets.all(10),
              borderRadius: 20,
              borderWidth: 2,
              borderColor: Colors.white,
              message: "Welcome! ${_auth.currentUser?.displayName}",
              snackStyle: SnackStyle.FLOATING,
              duration: const Duration(seconds: 1),
              // backgroundColor: Colors.green,
              snackPosition: SnackPosition.BOTTOM,
              backgroundGradient: LinearGradient(
                colors: [Colors.lightGreen, Colors.green.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              isDismissible: false,
              icon: const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.white,
              ),
            ),
          );
          Get.to(const Home(), binding: HomeBinder());
        },
      );
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          titleText: const Text(
            "Error Creating an Account !!",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          message: "$e",
          margin: const EdgeInsets.all(10),
          borderRadius: 20,
          borderWidth: 2,
          borderColor: Colors.white,
          snackStyle: SnackStyle.FLOATING,
          duration: const Duration(seconds: 1),
          // backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          backgroundGradient: LinearGradient(
            colors: [Colors.red, Colors.red.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          isDismissible: false,
          icon: const Icon(
            Icons.warning_amber_rounded,
            size: 40,
            color: Colors.amber,
          ),
        ),
      );
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
