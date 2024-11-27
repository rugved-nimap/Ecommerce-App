import 'package:ecommerce/pages/auth_pages/login_page.dart';
import 'package:ecommerce/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../binders/auth_binder.dart';
import '../../controllers/auth_controller.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              child: Container(
                height: MediaQuery.of(context).size.height - 40,
                margin: const EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Text(
                        'Create an\naccount',
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 34,
                            decoration: TextDecoration.none,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextfieldWidget(
                        controller: controller,
                        hint: "Email",
                        icon: Icons.person_outline_rounded,
                        isPassword: false,
                        editingController: controller.signupEmail,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextfieldWidget(
                        controller: controller,
                        hint: "Password",
                        icon: Icons.lock_outlined,
                        isPassword: true,
                        editingController: controller.signupPass,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 0),
                      child: TextfieldWidget(
                        controller: controller,
                        hint: "Confirm Password",
                        icon: Icons.lock_outlined,
                        isPassword: true,
                        editingController: controller.signupPass,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'By clicking the Register button, you agree to the public offer',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.normal,
                          color: Color(0xff676767),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: FilledButton(
                          onPressed: () {
                            controller.signup();
                          },
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            backgroundColor: const WidgetStatePropertyAll(
                              Color(0xffF83758),
                            ),
                          ),
                          child: const Text(
                            "Create Account",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(flex: 3, child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'I already have an account!',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.normal,
                            color: Color(0xff575757),
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.off(
                            const LoginPage(),
                            binding: AuthBinder(),
                            transition: Transition.leftToRight,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              color: Color(0xffF83758),
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
