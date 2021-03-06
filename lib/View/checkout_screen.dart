import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fnf_project/Models/Product.dart';
import 'package:fnf_project/View/product_list.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import '../Controller/product_cart_controller.dart';
import '../Models/CartModel.dart';
import '../Utils/shared_preference.dart';
import 'checkout_cataglog.dart';

class CheckoutScreen extends StatelessWidget {
  final CartController controller = Get.find();
  CartModel cartModel = CartModel();
  CheckoutScreen({Key? key}) : super(key: key);
  
  
  // TODO PREVENT TO CLOSE THE APP WHEN WE'LL PRESS BACK BUTTON
  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }
  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Please confirm'),
      content: const Text('Do you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: Text('Yes'),
        ),
      ],
    );
  }


  // TODO GETTING USERID
  var currentUserID = Constants.preferences?.getInt('USERID');



  // TODO POST CART DATA ON SERVER
  // cartPost()async{
  //   try{
  //     var response = await post(
  //         Uri.parse('http://192.168.100.155:8844/student_post/'),
  //         body: {
  //           "productId": controller.cID.toString(),
  //           "customerId": currentUserID.toString(),
  //           "total":  controller.cartSubTotal.toString(),
  //           "discount": controller.discountFeeFunction().toString(),
  //           "subTotal": controller.getFinalTotal().toString(),
  //           "qty": controller.cQTY.toString(),
  //         });
  //     if(response.statusCode != 200){
  //       var data = jsonDecode(response.body.toString());
  //       print(data);
  //       print("Order Confirm Successfully");
  //       Get.snackbar(
  //         "Order Confirm",
  //         'Successfully Confrim Order',
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white,
  //       );
  //     }else{
  //       print("Order Confirm Failed");
  //       Get.snackbar(
  //         "Order Confirm",
  //         'Failed Order',
  //         backgroundColor: Colors.redAccent,
  //         colorText: Colors.white,
  //       );
  //     }
  //   } catch(e){
  //     print(e.toString());
  //     Get.snackbar(
  //       "Network Error",
  //       e.toString(),
  //       backgroundColor: Colors.redAccent,
  //       colorText: Colors.white,
  //     );
  //   }
  //
  // }

  List<Items> cartProducts = [];
  var token = Constants.preferences?.getString('Token');


  //
  void send()async{
    List<int> myProducts = List.from(controller.cID);
    List<int> myQuantities = List.from(controller.cQTY);
    for (var i = 0; i < myProducts.length; i++){
      cartProducts.add(Items(product: myProducts[i], quantity: myQuantities[i]));
    }
    cartModel = CartModel(
      items: cartProducts,
      total: controller.cartSubTotal,
      discount: controller.discountFeeFunction(),
      subTotal: controller.getFinalTotal(),
    );
    print(cartModel.toJson());
    var response = await post(
      Uri.parse('http://192.168.100.240:5000/api/orders/new/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Token ${token}'
        },
      body: jsonEncode(cartModel.toJson()));
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      print("Order Confirm Successful");
    }else{
      print(response.statusCode);
    }
    print(data);
  }



  @override
  Widget build(BuildContext context) {
    String? noData = "No Item Selected";
   var cart = 0.0;
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade500,
          leading: IconButton(
            onPressed: (){
              Get.to(
                const ProductListScreen(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 700),
              );
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 25,),
          ),
          title: const Text(
            "Checkout",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              CheckoutCatalog(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: MaterialButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                if(controller.cartSubTotal != null)...[
                                  Text("${controller.cartSubTotal}")
                                ]else...[
                                  Text("${cart}")
                                ]
                                // Text(
                                //   "${controller.cartSubTotal}"
                                // ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Discount",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),

                                // Obx(() =>  Text(
                                //   controller.discountFeeFunction().toString(),
                                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue.shade500),
                                // )),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "SubTotal",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),

                                // Text(
                                //   controller.getFinalTotal().toString(),
                                //   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                // )
                              ],
                            ),
                            const SizedBox(height: 25.0),
                            MaterialButton(
                              onPressed: () {
                                send();
                              },
                              color: Colors.blue.shade500,
                              child: const Text("Confirm Order", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            )
                          ],
                        )
                    );
                  },
                  color: Colors.blue.shade500,
                  child: const Text("Cart Total", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


