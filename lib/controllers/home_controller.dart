import 'package:ecommerce/models/productModel.dart';
import 'package:ecommerce/models/sqf_model.dart';
import 'package:ecommerce/repository/data_fetch_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/database_service.dart';

class HomeController extends GetxController {
  int currentPageIndex = 0;
  PageController pageController = PageController();
  bool isDarkMode = false;
  int selectedProductId = 0;

  final DataFetchRepo _dataFetchRepo = DataFetchRepo();
  final DatabaseService _databaseService = DatabaseService.instance;

  List<Productmodel> productData = [];

  List<Productmodel> wisListProducts = [];
  List<Productmodel> shoppingProducts = [];
  // bool isWishList = false;

  @override
  void onInit() {
    fetchData();
    super.onInit();
    isDarkMode = Get.isDarkMode;
    if (kDebugMode) {
      print("$isDarkMode  ======  ${Get.isDarkMode}");
    }
  }

  void changePage(int index) {
    currentPageIndex = index;
    pageController.animateToPage(
      currentPageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    update();
  }

  void changeTheme(bool value) {
    isDarkMode = !isDarkMode;
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    update();
  }

  void fetchData() async {
    try {
      productData = await _dataFetchRepo.fetchData("products");
    } catch (e) {
      debugPrint("Error $e");
    }
    update();
  }

  void addToWishList(int index) async {
    bool isInWishList = isWishList(index);

    if (isInWishList) {
      wisListProducts.remove(productData[index]);
    } else {
      wisListProducts.add(productData[index]);
    }
    update();
  }

  bool isWishList(int index) {
    return wisListProducts.any((product) => product.id == productData[index].id);
  }


  void getDatabaseData() async {
    List<SqfModel> wishList = await _databaseService.getList(
      _databaseService.database2,
      _databaseService.wishListTableName,
    );

    List<SqfModel> shoppingList = await _databaseService.getList(
      _databaseService.database1,
      _databaseService.shoppingTableName,
    );
  }
}
