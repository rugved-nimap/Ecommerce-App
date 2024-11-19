import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce/binders/search_binder.dart';
import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/pages/search.dart';
import 'package:ecommerce/pages/sub_pages/home_page.dart';
import 'package:ecommerce/pages/sub_pages/profile_page.dart';
import 'package:ecommerce/pages/sub_pages/setting_page.dart';
import 'package:ecommerce/pages/sub_pages/wishList_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: PageView.builder(
            controller: controller.pageController,
            itemCount: 4,
            itemBuilder: (context, index) {
              if (index == 0) {
                return HomePage(
                  controller: controller,
                );
              } else if (index == 1) {
                return const WishlistPage();
              } else if (index == 2) {
                return const SettingPage();
              } else if (index == 3) {
                return const ProfilePage();
              }
              return const Center(child: Text("Error 404: Page Not Found"));
            },
            onPageChanged: (value) {
              controller.currentPageIndex = value;
              controller.update();
            },
          ),
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(
                const Search(),
                binding: SearchBinder(),
                transition: Transition.downToUp,
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            backgroundColor: Colors.amber,
            child: const Icon(Icons.search),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: const [
              Icons.home_filled,
              Icons.favorite_border_rounded,
              Icons.settings_rounded,
              Icons.person_rounded,
            ],
            activeIndex: controller.currentPageIndex,
            onTap: (value) {
              controller.changePage(value);
            },
            activeColor: Colors.amber,
            inactiveColor: Colors.white54,
            backgroundColor: const Color(0xff232327),
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            notchMargin: 12,
            leftCornerRadius: 25,
            rightCornerRadius: 25,
            height: 65,
            splashSpeedInMilliseconds: 250,
          ),
        );
      },
    );
  }
}
