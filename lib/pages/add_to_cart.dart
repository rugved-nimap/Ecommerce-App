import 'package:ecommerce/widgets/textfield_widget.dart';
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
                color: Theme.of(context).cardColor,
                height: 400,
                margin: const EdgeInsets.symmetric(vertical: 2.5),
                child: ListView.builder(
                  itemCount: controller.cartMap.entries.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 85,
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            width: 1,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network(
                              controller.cartMap.entries
                                  .elementAt(index)
                                  .key
                                  .thumbnail,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.cartMap.entries
                                      .elementAt(index)
                                      .key
                                      .title,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  "\$ ${controller.cartMap.entries.elementAt(index).key.price}",
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
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreenAccent.shade100
                                        .withOpacity(0.25),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.green),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.removeFromShoppingCart(
                                              controller.cartMap.entries
                                                  .elementAt(index)
                                                  .key);
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: Theme.of(context).primaryColor,
                                          size: 18,
                                        ),
                                      ),
                                      Text(
                                        "${controller.cartMap.entries.elementAt(index).value}",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 17,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.addInShoppingCart(
                                              controller.cartMap.entries
                                                  .elementAt(index)
                                                  .key);
                                        },
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
                () {
                  Get.bottomSheet(
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 20, top: 35),
                              child: Text.rich(
                                const TextSpan(children: [
                                  TextSpan(
                                    text: "Choose\n",
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Location",
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                ]),
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Theme.of(context).primaryColor,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Container(
                            width: double.infinity,
                            height: 55,
                            margin: const EdgeInsets.all(20),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: const WidgetStatePropertyAll(
                                    Colors.redAccent),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Location",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: false
                                ? ListView.builder(
                                    itemBuilder: (context, index) {
                                      return const Text("data");
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      "No Address Available",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontFamily: "Poppins",
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    backgroundColor: Theme.of(context).cardColor,
                  );
                },
              ),
              buttons(
                context,
                "Payment Method",
                controller.paymentMethod,
                Icons.payment_outlined,
                () {
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      double.infinity,
                      MediaQuery.of(context).size.height - 250,
                      0,
                      0,
                    ),
                    items: [
                      PopupMenuItem(
                        value: "UPI",
                        child: Text(
                          "UPI",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: "Credit / Debit Card",
                        child: Text(
                          "Credit / Debit Card",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: "Net Banking",
                        child: Text(
                          "Net Banking",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    elevation: 10,
                    color: Theme.of(context).cardColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    menuPadding: const EdgeInsets.all(10),
                  ).then(
                    (value) {
                      if (value != null) {
                        controller.paymentMethod = value;
                        controller.update();
                      }
                    },
                  );
                },
              ),
              buttons(
                context,
                "Referral Code",
                "Refer Code : ",
                Icons.airplane_ticket_outlined,
                () {
                  Get.bottomSheet(
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 35),
                            child: Text(
                              "Referral",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Theme.of(context).primaryColor,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              // controller: editingController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xffF83758),
                                  ),
                                ),
                                prefixIcon: const Icon(Icons.password_rounded),
                                prefixIconColor: Colors.grey.shade600,
                                hintText: "Enter Referral Code",
                                hintStyle: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                                filled: true,
                                fillColor:
                                    const Color(0xffA8A8A9).withOpacity(0.25),
                                contentPadding: const EdgeInsets.all(20),
                              ),
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                                color: Color(0xff676767),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 55,
                            margin: const EdgeInsets.all(20),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: const WidgetStatePropertyAll(
                                  Colors.redAccent,
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.verified_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Verify Referral",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    backgroundColor: Theme.of(context).cardColor,
                  );
                },
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
            icon: const Icon(
              Icons.payment,
              color: Colors.white,
            ),
            label: const Text(
              "Purchase Order",
              style: TextStyle(
                color: Colors.white,
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
          backgroundColor: WidgetStatePropertyAll(Theme.of(context).cardColor),
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
