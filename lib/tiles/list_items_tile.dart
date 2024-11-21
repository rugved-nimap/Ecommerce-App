import 'package:ecommerce/binders/product_detail_binder.dart';
import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/pages/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsTile extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String description;
  final double price;
  final int id;
  final int index;

  const ListItemsTile({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.description,
    required this.price,
    required this.id,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          Get.find<HomeController>().selectedProductId = id;
          Get.to(
            const ProductDetail(),
            binding: ProductDetailBinder(),
            transition: Transition.zoom,
          );
        },
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          elevation: const WidgetStatePropertyAll(5),
          backgroundColor: WidgetStatePropertyAll(Theme.of(context).cardColor),
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          overlayColor: WidgetStatePropertyAll(
            Colors.blueAccent.withOpacity(0.05),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Image.network(
                thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "\$$price",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  Get.find<HomeController>().addToWishList(index);
                },
                icon: Icon(
                  Get.find<HomeController>().isWishList(index) ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                  color: Get.find<HomeController>().isWishList(index) ? Colors.redAccent : Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
