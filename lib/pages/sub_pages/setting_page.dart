import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/pages/splash_screens/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 55,
            bottom: 20,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Settings",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 3),
                        blurRadius: 3,
                      )
                    ]),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'DarkMode',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: "Poppins",
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: controller.isDarkMode,
                      onChanged: (value) {
                        controller.changeTheme(value);
                      },
                      activeColor: Colors.amber,
                      inactiveTrackColor: Colors.grey.shade900,
                      inactiveThumbColor: Colors.white,
                      trackOutlineWidth: const WidgetStatePropertyAll(0),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(5),
                    backgroundColor:
                        WidgetStatePropertyAll(Theme.of(context).cardColor),
                    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                    overlayColor: WidgetStatePropertyAll(
                      Colors.blueAccent.withOpacity(0.05),
                    ),
                  ),
                  child: Text(
                    'Terms and Services',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: "Poppins",
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(5),
                    backgroundColor:
                        WidgetStatePropertyAll(Theme.of(context).cardColor),
                    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                    overlayColor: WidgetStatePropertyAll(
                      Colors.blueAccent.withOpacity(0.05),
                    ),
                  ),
                  child: Text(
                    'Privacy and Policy',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: "Poppins",
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then(
                      (value) {
                        Get.offAllNamed("/");
                      },
                    );
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(5),
                    backgroundColor:
                        WidgetStatePropertyAll(Theme.of(context).cardColor),
                    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                    overlayColor: WidgetStatePropertyAll(
                      Colors.blueAccent.withOpacity(0.05),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: "Poppins",
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
