import 'package:ecommerce/binders/auth_binder.dart';
import 'package:ecommerce/pages/auth_pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<StatefulWidget> createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  bool isLastPage = false;
  bool isFirstPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (value) => setState(() {
            _currentPage = value;
            isLastPage = _currentPage == 2 ? true : false;
            isFirstPage = _currentPage == 0 ? true : false;
          }),
          children: [
            pageViewTiles(
              'Choose Product',
              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
              'assets/svg_images/splash_screen_img1.svg',
            ),
            pageViewTiles(
              'Make Payment',
              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
              'assets/svg_images/splash_screen_img2.svg',
            ),
            pageViewTiles(
              'Get your Order',
              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
              'assets/svg_images/splash_screen_img3.svg',
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_currentPage + 1}/3',
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  color: Theme.of(context).primaryColor,
                  fontSize: 15,
                ),
              ),
              TextButton(
                onPressed: () => Get.off(
                  const LoginPage(),
                  binding: AuthBinder(),
                  transition: Transition.rightToLeftWithFade,
                ),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: isFirstPage
                      ? null
                      : () {
                          _currentPage--;
                          _pageController.animateToPage(
                            _currentPage,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                          );
                        },
                  child: Text(
                    'Previous',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: isFirstPage ? Colors.grey : Theme.of(context).primaryColor,
                      fontSize: 17,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (isLastPage) {
                      Get.off(
                        const LoginPage(),
                        binding: AuthBinder(),
                        transition: Transition.rightToLeftWithFade,
                      );
                    } else {
                      _currentPage++;
                      _pageController.animateToPage(
                        _currentPage,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: isLastPage
                        ? const WidgetStatePropertyAll(Colors.redAccent)
                        : null,
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    isLastPage ? 'Get Started' : 'Next',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: isLastPage ? Colors.white : Theme.of(context).primaryColor,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: _currentPage == 0 ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _currentPage == 0 ? Colors.redAccent : Theme.of(context).primaryColorLight,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: _currentPage == 1 ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _currentPage == 1 ? Colors.redAccent : Theme.of(context).primaryColorLight,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: _currentPage == 2 ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _currentPage == 2 ? Colors.redAccent : Theme.of(context).primaryColorLight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget pageViewTiles(String title, String description, String imagePath) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            Text(
              title,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Theme.of(context).primaryColor,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                color: Theme.of(context).primaryColorLight,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
