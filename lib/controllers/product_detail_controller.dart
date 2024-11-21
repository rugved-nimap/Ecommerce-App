import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/data_fetch_repo.dart';
import '../services/database_service.dart';

class ProductDetailController extends GetxController {
  final DataFetchRepo _dataFetchRepo = DataFetchRepo();
  final DatabaseService _databaseService = DatabaseService.instance;
  bool isWishList = false;
  bool isAddCart = false;

  Productmodel? productData;
  final HomeController _controller = Get.find<HomeController>();

  @override
  void onInit() {
    getDataOfProduct(Get.find<HomeController>().selectedProductId);
    super.onInit();
  }

  void getDataOfProduct(int id) async {
    try {
      productData = await _dataFetchRepo.fetchProductDetails("products/$id");
    } catch (e) {
      debugPrint("Error $e");
    }
    update();
  }

  void addToWishList() async {
    isWishList = !isWishList;
    if (isWishList) {
      _controller.wisListProducts.add(productData!);
    } else {
      _controller.wisListProducts.remove(productData!);
    }
    update();
  }

  void addToCart() async {
    isAddCart = !isAddCart;
    if (isAddCart) {
      _controller.shoppingProducts.add(productData!);
    } else {
      _controller.shoppingProducts.remove(productData!);
    }
    update();
  }

}
