import 'package:ecommerce/binders/home_binder.dart';
import 'package:ecommerce/binders/product_detail_binder.dart';
import 'package:ecommerce/pages/auth_pages/login_page.dart';
import 'package:ecommerce/pages/auth_pages/signup_page.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/product_detail.dart';
import 'package:ecommerce/pages/splash_screens/landing_page.dart';
import 'package:ecommerce/pages/sub_pages/home_page.dart';
import 'package:ecommerce/theme/themeData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_links5/uni_links.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? link;

  @override
  void initState() {
    handleDeepLink();
    super.initState();
  }

  Future<void> handleDeepLink() async {
    try {
      link = await getInitialLink();

      if (link != null && link!.contains('/home/product')) {
        final productId = link?.split('/').last;

        Get.offAll(
          () => const ProductDetail(),
          binding: ProductDetailBinder(),
          transition: Transition.zoom,
          arguments: {'id': productId},
        );
      } else {
        link = '/';
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error processing deep link: $e");
      }
      link = '/';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce App',
      theme: Themedata().lightMode(),
      themeMode: ThemeMode.light,
      darkTheme: Themedata().darkMode(),
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinder(),
      initialRoute: link ?? (FirebaseAuth.instance.currentUser != null ? '/home' : '/'),
      routes: {
        '/' : (context) => const LandingPage(),
        '/login' : (context) => const LoginPage(),
        '/signup' : (context) => const SignupPage(),
        '/home' : (context) => const Home(),
        '/home/product' : (context) => const ProductDetail(),
      },
      // getPages: [
      //   GetPage(
      //     name: '/',
      //     page: () => const LandingPage(),
      //   ),
      //   GetPage(
      //     name: '/login',
      //     page: () => const LoginPage(),
      //     binding: AuthBinder(),
      //   ),
      //   GetPage(
      //       name: '/signup',
      //       page: () => const SignupPage(),
      //       binding: AuthBinder()),
      //   GetPage(
      //     name: '/home',
      //     page: () => const HomePage(),
      //     binding: HomeBinder(),
      //   ),
      //   GetPage(
      //     name: '/home/product',
      //     page: () => const ProductDetail(),
      //     bindings: [HomeBinder(), ProductDetailBinder()],
      //   ),
      // ],
    );
  }
}
