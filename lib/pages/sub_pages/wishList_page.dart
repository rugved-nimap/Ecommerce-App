import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/tiles/list_items_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Text(
                'Your WishList',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.wisListProducts.length,
                itemBuilder: (context, index) {
                  return ListItemsTile(
                    thumbnail: controller.wisListProducts[index].thumbnail,
                    title: controller.wisListProducts[index].title,
                    description: controller.wisListProducts[index].description,
                    price: controller.wisListProducts[index].price,
                    id: controller.wisListProducts[index].id,
                    isWishlist: controller.isWishList(index, controller.wisListProducts),
                    add: () {
                      controller.addToWishList(index, controller.wisListProducts);
                    },
                    back: () {
                      controller.update();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
