import 'package:flutter/material.dart';

import '../controllers/auth_controller.dart';

class TextfieldWidget extends StatelessWidget {
  AuthController controller;
  String hint;
  IconData icon;
  bool isPassword;
  TextEditingController editingController;

  TextfieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.isPassword,
    required this.editingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editingController,
      obscureText: isPassword ? controller.isObscure : false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            width: 2,
            color: Color(0xffF83758),
          ),
        ),
        prefixIcon: Icon(icon),
        prefixIconColor: Colors.grey.shade600,
        hintText: hint,
        hintStyle: const TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.normal,
            color: Colors.grey),
        filled: true,
        fillColor: const Color(0xffA8A8A9).withOpacity(0.25),
        contentPadding: const EdgeInsets.all(20),
        suffixIcon: isPassword
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  icon: Icon(
                    controller.isObscure
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    controller.changeObscure();
                  },
                ),
              )
            : null,
      ),
      style: const TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.bold,
        color: Color(0xff676767),
        fontSize: 15,
      ),
    );
  }
}
