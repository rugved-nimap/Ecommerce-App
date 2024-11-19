import 'package:ecommerce/pages/splash_screens/landing_page.dart';
import 'package:ecommerce/theme/themeData.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce App',
      theme: Themedata().lightMode(),
      themeMode: ThemeMode.light,
      darkTheme: Themedata().darkMode(),
      home: const LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
