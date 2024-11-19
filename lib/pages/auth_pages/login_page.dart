import 'package:ecommerce/binders/auth_binder.dart';
import 'package:ecommerce/binders/home_binder.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/pages/auth_pages/signup_page.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Text(
                    'Welcome\nBack!',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 34,
                      decoration: TextDecoration.none,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextfieldWidget(
                    controller: controller,
                    hint: "Email",
                    icon: Icons.person_outline_rounded,
                    isPassword: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                    bottom: 0,
                  ),
                  child: TextfieldWidget(
                    controller: controller,
                    hint: "Password",
                    icon: Icons.lock_outlined,
                    isPassword: true,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.normal,
                        color: Color(0xffF83758),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: FilledButton(
                      onPressed: () =>
                          Get.to(const Home(), binding: HomeBinder()),
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
                        "Login",
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
                const Spacer(
                  flex: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Create an account !',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.normal,
                        color: Color(0xff575757),
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.off(
                        const SignupPage(),
                        binding: AuthBinder(),
                        transition: Transition.rightToLeft,
                      ),
                      child: const Text(
                        'Sign Up',
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
        );
      },
    );
  }
}
