import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Your Cart',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 30,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.shade200,
                height: 400,
                child: ListView.builder(
                  itemCount: controller.shoppingProducts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 75,
                      color: Theme.of(context).cardColor,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network(
                              controller.shoppingProducts[index].thumbnail,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.shoppingProducts[index].title,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  controller.shoppingProducts[index].price
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 17,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Quantity",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreenAccent.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.green),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        child: Icon(
                                          Icons.remove,
                                          color: Theme.of(context).primaryColor,
                                          size: 18,
                                        ),
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 17,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        child: Icon(
                                          Icons.add,
                                          color: Theme.of(context).primaryColor,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              buttons(
                context,
                "Address",
                "User Address",
                Icons.maps_home_work_outlined,
                () {},
              ),
              buttons(
                context,
                "Payment Method",
                "UPI",
                Icons.payment_outlined,
                () {},
              ),
              // marginAll(10),
              buttons(
                context,
                "Referral Code",
                "Refer Code : ",
                Icons.airplane_ticket_outlined,
                () {},
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(Colors.indigo),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            icon: Icon(
              Icons.payment,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            label: Text(
              "Purchase Order",
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 17,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget buttons(BuildContext context, String title, String subtitle,
      IconData icon, VoidCallback action) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 2.5),
      child: FilledButton(
        onPressed: action,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          backgroundColor: const WidgetStatePropertyAll(Colors.white),
          overlayColor: WidgetStatePropertyAll(
            Colors.indigoAccent.shade100.withOpacity(0.25),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
