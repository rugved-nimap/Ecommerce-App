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

  final DataFetchRepo _dataFetchRepo = DataFetchRepo();
  final DatabaseService _databaseService = DatabaseService.instance;

  String paymentMethod = "UPI";

  List<Productmodel> productData = [];

  List<Productmodel> wisListProducts = [];
  List<Productmodel> shoppingProducts = [];

  Map<Productmodel, int> cartMap = {};

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

  void addToWishList(int index, List<Productmodel> list) async {
    bool isInWishList = isWishList(index, list);

    if (isInWishList) {
      wisListProducts.removeWhere((element) => element.id == list[index].id);
    } else {
      wisListProducts.add(list[index]);
    }
    update();
  }

  bool isWishList(int index, List<Productmodel> list) {
    return wisListProducts.any((product) => product.id == list[index].id);
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


  void removeFromShoppingCart(Productmodel product) {
    shoppingProducts.remove(product);
    updateMapList();
    update();
  }

  void addInShoppingCart(Productmodel product) {
    shoppingProducts.add(product);
    updateMapList();
    update();
  }

  void updateMapList() {
    cartMap.clear();
    for (var product in shoppingProducts) {
      if (cartMap.containsKey(product)) {
        cartMap[product] = cartMap[product]! + 1;
      } else {
        cartMap[product] = 1;
      }
    }
  }
}
