import 'package:ecommerce/controllers/search_page_controller.dart';
import 'package:ecommerce/tiles/list_items_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPageController>(
      builder: (controller) {
        return Scaffold(
          body: ListView(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
            children: [
              Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                    size: 45,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: Theme.of(context).primaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: TextField(
                  controller: controller.textEditingController,
                  onChanged: (value) {
                    controller.fetchDataFromSearch(value);
                  },
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
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
              if (controller.searchList.isNotEmpty && controller.textEditingController.text.isNotEmpty) ...{
                ...List.generate(
                  controller.searchList.length,
                  (index) {
                    return ListItemsTile(
                      thumbnail: controller.searchList[index].thumbnail,
                      title: controller.searchList[index].title,
                      description: controller.searchList[index].description,
                      price: controller.searchList[index].price,
                      id: controller.searchList[index].id,
                      index: index,
                    );
                  },
                )
              } else if (controller.categorySearchList.isNotEmpty && controller.textEditingController.text.isNotEmpty) ... {
                ...List.generate(
                  controller.categorySearchList.length,
                      (index) {
                    return ListItemsTile(
                      thumbnail: controller.categorySearchList[index].thumbnail,
                      title: controller.categorySearchList[index].title,
                      description: controller.categorySearchList[index].description,
                      price: controller.categorySearchList[index].price,
                      id: controller.searchList[index].id,
                      index: index,
                    );
                  },
                )
              } else ...{
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 10,
                  direction: Axis.horizontal,
                  children: [
                    ...List.generate(
                      controller.categoryList.length,
                      (index) {
                        return SizedBox(
                          width: 165,
                          height: 165,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.fetchDataFromCategory(
                                  controller.categoryList[index]["name"]);
                            },
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              elevation: const WidgetStatePropertyAll(5),
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).cardColor),
                              padding:
                                  const WidgetStatePropertyAll(EdgeInsets.zero),
                              overlayColor: WidgetStatePropertyAll(
                                Colors.blueAccent.withOpacity(0.05),
                              ),
                            ),
                            child: Text(
                              controller.categoryList[index]["name"],
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 17),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              }
            ],
          ),
        );
      },
    );
  }
}
