import 'dart:async';

import 'package:ecommerce/models/productModel.dart';
import 'package:ecommerce/repository/data_fetch_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final DataFetchRepo _dataFetchRepo = DataFetchRepo();
  List<dynamic> categoryList = [];
  List<Productmodel> searchList = [];
  List<Productmodel> categorySearchList = [];

  Timer? _timer;

  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    getCategoryList();
    super.onInit();
  }

  void getCategoryList() async {
    try {
      categoryList =
          await _dataFetchRepo.fetchCategories("products/categories");
    } catch (e) {
      print(e);
    }
    update();
  }

  void fetchDataFromSearch(String query) async {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer = Timer(
      const Duration(seconds: 1),
      () async {
        if (textEditingController.text.isNotEmpty) {
          searchList =
              await _dataFetchRepo.fetchData("products/search?q=$query");
        } else {
          searchList.clear();
          print("clear");
        }
        update();
      },
    );
  }

  void fetchDataFromCategory(String slugs) async {
    textEditingController.text = slugs;
    try {
      categorySearchList =
          await _dataFetchRepo.fetchData("products/category/$slugs");
    } catch (e) {
      print(e);
    }
    update();
  }
}
