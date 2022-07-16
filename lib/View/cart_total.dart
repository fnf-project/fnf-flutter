// import 'package:flutter/material.dart';
// import 'package:fnf_project/Utils/shared_preference.dart';
// import 'package:fnf_project/Controller/product_cart_controller.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class CartTotal extends StatelessWidget {
//   final CartController controller = Get.find();
//   CartTotal({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() =>
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 75),
//           child: Column(
//             children: [
//               const Center(
//                   child:
//                   Text(
//                     "PRODUCTS AMOUNT",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w900, fontSize: 19
//                     ),
//                   )),
//               const SizedBox(height: 25,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "SubTotal",
//                     style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
//                   ),
//                   Text(
//                     "${controller.cartSubTotal}",
//                     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Discount",
//                     style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
//                   ),
//                   Obx(() =>  Text(
//                     "${controller.discountFeeFunction()}",
//                     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   )),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Total",
//                     style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
//                   ),
//                   Text(
//                     "${controller.getFinalTotal()}",
//                     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 25.0),
//               MaterialButton(
//                 onPressed: (){},
//                 color: Colors.blue.shade500,
//                 child: const Text("Confirm Order", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//               )
//             ],
//           ),
//         ),
//     );
//   }
// }
