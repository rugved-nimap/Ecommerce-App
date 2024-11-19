import 'package:ecommerce/models/productModel.dart';
import 'package:ecommerce/models/sqf_model.dart';
import 'package:ecommerce/repository/data_fetch_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/database_service.dart';

class HomeController extends GetxController {
  int currentPageIndex = 0;
  PageController pageController = PageController();
  bool isDarkMode = false;

  final DataFetchRepo _dataFetchRepo = DataFetchRepo();
  final DatabaseService databaseService = DatabaseService.instance;

  List<Productmodel> productData = [];

  List<Productmodel> wisListProducts = [];
  List<Productmodel> shoppingProducts = [];

  @override
  void onInit() {
    fetchData();
    super.onInit();
    isDarkMode = Get.isDarkMode;
    print("$isDarkMode  ======  ${Get.isDarkMode}");
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
      print("Error $e");
    }
    update();
  }

  void getDatabaseData() async {
    List<SqfModel> wishList = await databaseService.getList(
      databaseService.database2,
      databaseService.wishListTableName,
    );



    List<SqfModel> shoppingList = await databaseService.getList(
      databaseService.database1,
      databaseService.shoppingTableName,
    );
  }
}
