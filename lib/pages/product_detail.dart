import 'package:ecommerce/controllers/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (controller) {
        return Scaffold(
          body: !controller.isLoading
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 90,
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Expanded(
                              child: Marquee(
                                text:
                                    "${controller.productData.category[0].toUpperCase()}${controller.productData.category.substring(1).toLowerCase()} Products",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 30,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                ),
                                pauseAfterRound: const Duration(seconds: 1),
                                blankSpace: 150,
                                startPadding: 10,
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 400,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 15),
                        child: PageView.builder(
                          itemCount: controller.productData.images.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(
                              controller.productData.images[index],
                              fit: BoxFit.contain,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star_rate_rounded,
                              color: Colors.orangeAccent,
                              size: 30,
                              shadows: [
                                BoxShadow(
                                  color: Colors.yellowAccent,
                                  blurRadius: 4,
                                  offset: Offset(1, 1),
                                )
                              ],
                            ),
                            Text(
                              controller.productData.rating.toString(),
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          controller.productData.title,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 22,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          controller.productData.description,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$${controller.productData.price}",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 22,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "-${controller.productData.discountPercentage}%",
                              style: const TextStyle(
                                  color: Colors.lightGreen,
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.normal,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(1, 1),
                                    )
                                  ]),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "\$${(controller.productData.price / (1 - controller.productData.discountPercentage / 100)).toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: (Theme.of(context).primaryColor)
                                      .withOpacity(0.5),
                                  fontSize: 22,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Wrap(
                          runSpacing: 10,
                          spacing: 10,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 5,
                                bottom: 5,
                              ),
                              child: Text(
                                "Tags: ",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                            ...List.generate(
                              controller.productData.tags.length,
                              (index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).cardColor,
                                  ),
                                  child: Text(
                                    controller.productData.tags[index],
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(1),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      textView(context, "Brand", controller.productData.brand,
                          top: 20),
                      textView(context, "Weight",
                          controller.productData.weight.toString()),
                      textView(context, "Warranty",
                          controller.productData.warrantyInformation),
                      textView(context, "Shipping",
                          controller.productData.shippingInformation),
                      textView(context, "Return Policy",
                          controller.productData.returnPolicy),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).cardColor,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1, 1),
                                blurRadius: 2,
                              )
                            ]),
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                "Dimension",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Divider(
                                color: Colors.blueAccent.withOpacity(0.25),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.width_full,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Text(
                                      controller.productData.dimensions["width"]
                                          .toString(),
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "Width",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.height,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Text(
                                      controller
                                          .productData.dimensions["height"]
                                          .toString(),
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "Height",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.layers_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Text(
                                      controller.productData.dimensions["depth"]
                                          .toString(),
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "Depth",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          "Reviews",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 22,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 125,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 4),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: PageView.builder(
                          itemCount: controller.productData.reviews.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.productData
                                            .reviews[index]["reviewerName"]
                                            .toString(),
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 17,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.star_rate_rounded,
                                        color: Colors.orangeAccent,
                                        size: 30,
                                        shadows: [
                                          BoxShadow(
                                            color: Colors.yellowAccent,
                                            blurRadius: 4,
                                            offset: Offset(1, 1),
                                          )
                                        ],
                                      ),
                                      Text(
                                        controller.productData
                                            .reviews[index]["rating"]
                                            .toString(),
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 17,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    controller.productData
                                        .reviews[index]["reviewerEmail"]
                                        .toString(),
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 11,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    controller
                                        .productData.reviews[index]["comment"]
                                        .toString(),
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 15,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "${DateTime.parse(controller.productData.reviews[index]["date"]).day}-${DateTime.parse(controller.productData.reviews[index]["date"]).month}-${DateTime.parse(controller.productData.reviews[index]["date"]).year}",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 10,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: ElevatedButton.icon(
                          onPressed: controller.isAddCart
                              ? null
                              : () {
                                  controller.addToCart();
                                },
                          style: ButtonStyle(
                            backgroundColor:
                                const WidgetStatePropertyAll(Colors.indigo),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          label: Text(
                            controller.isAddCart ? "Added" : "Add to Cart",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 20),
                        child: FilledButton.icon(
                          onPressed: () {
                            controller.addToWishList();
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                controller.isWishList
                                    ? Colors.redAccent
                                    : Colors.transparent),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: controller.isWishList
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          icon: Icon(
                            controller.isWishList
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: controller.isWishList
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                          ),
                          label: Text(
                            controller.isWishList
                                ? "Remove from Wishlist"
                                : "Add to Wishlist",
                            style: TextStyle(
                              color: controller.isWishList
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget textView(BuildContext context, String label, String detail,
      {double top = 5, double bottom = 0}) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: top, bottom: bottom),
      child: Row(
        children: [
          Text(
            "• $label : ",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 15,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            " $detail",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 15,
              fontFamily: "Poppins",
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
