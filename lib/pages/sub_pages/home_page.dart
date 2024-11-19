import 'package:ecommerce/binders/search_binder.dart';
import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/pages/add_to_cart.dart';
import 'package:ecommerce/pages/search.dart';
import 'package:ecommerce/tiles/list_items_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomeController controller;

  HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.fetchData();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      Text(
                        "Rugved",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 25,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      onPressed: () {
                        Get.to(
                          const AddToCart(),
                          transition: Transition.fadeIn,
                        );
                      },
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        backgroundColor:
                            WidgetStatePropertyAll(Theme.of(context).cardColor),
                        elevation: const WidgetStatePropertyAll(20),
                      ),
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                onTap: () {
                  Get.to(
                    const Search(),
                    binding: SearchBinder(),
                  );
                },
                readOnly: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).primaryColorDark,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                      fontFamily: "Poppins",
                      color: Theme.of(context).hintColor),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: 175,
                width: double.infinity,
                child: PageView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage('assets/images/${index + 1}.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (controller.productData.isNotEmpty) ...{
                ...List.generate(
                  controller.productData.length,
                  (index) {
                    return ListItemsTile(
                      thumbnail: controller.productData[index].thumbnail,
                      title: controller.productData[index].title,
                      description: controller.productData[index].description,
                      price: controller.productData[index].price,
                    );
                  },
                )
              } else ...{
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    'Please wait while the data is loading !!',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                )
              }
            ],
          ),
        ),
      ),
    );
  }
}
