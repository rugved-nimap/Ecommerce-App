import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/data_fetch_repo.dart';
import '../services/database_service.dart';

class ProductDetailController extends GetxController {
  final DataFetchRepo _dataFetchRepo = DataFetchRepo();
  final DatabaseService _databaseService = DatabaseService.instance;
  bool isLoading = true;
  bool isWishList = false;
  bool isAddCart = false;

  late Productmodel productData;
  final HomeController _controller = Get.find<HomeController>();

  @override
  void onInit() {
    getDataOfProduct(Get.arguments['id']);
    isWishList = _controller.wisListProducts
        .any((product) => product.id == Get.arguments['id']);
    super.onInit();
  }

  void getDataOfProduct(int id) async {
    isLoading = true;
    try {
      productData = (await _dataFetchRepo.fetchProductDetails("products/$id"))!;
    } catch (e) {
      debugPrint("Error $e");
    }
    isLoading = false;
    update();
  }

  void addToWishList() {
    isWishList = !isWishList;
    debugPrint(isWishList.toString());
    if (isWishList) {
      _controller.wisListProducts.add(productData);
    } else {
      _controller.wisListProducts.removeWhere((element) => element.id == productData.id);
    }
    update();
  }

  void addToCart() {
    isAddCart = !isAddCart;
    if (isAddCart) {
      _controller.shoppingProducts.add(productData);
    } else {
      _controller.shoppingProducts.removeWhere((element) => element.id == productData.id);
    }
    print("${_controller.shoppingProducts[0].title}");
    update();
  }
}
