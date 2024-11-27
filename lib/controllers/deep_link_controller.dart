// import 'package:ecommerce/pages/product_detail.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:uni_links3/uni_links.dart';
//
// class DeepLinkController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//     handleDeepLink();
//   }
//
//   Future<void> handleDeepLink() async {
//     try {
//       final link = await getInitialLink();
//
//       if (link != null && link.contains('/home/product')) {
//         final productId = link.split('/').last;
//
//         Get.to(
//           () => const ProductDetail(),
//           transition: Transition.zoom,
//           arguments: {'id': productId},
//         );
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print("Error processing deep link: $e");
//       }
//     }
//   }
// }
