import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fnf_project/View/product_list.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import '../Controller/product_cart_controller.dart';
import '../Utils/shared_preference.dart';
import 'checkout_cataglog.dart';

class CheckoutScreen extends StatelessWidget {
  final CartController controller = Get.find();
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
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'),
        ),
      ],
    );
  }


  // TODO GETTING USERID
  var currentUserID = Constants.preferences?.getInt('USERID');


  // TODO POST CART DATA ON SERVER
  cartPost()async{
    try{
      var response = await post(
          Uri.parse('http://192.168.100.155:8844/student_post/'),
          body: {
            "productId": controller.cID.toString(),
            "customerId": currentUserID.toString(),
            "total":  controller.cartSubTotal.toString(),
            "discount": controller.discountFeeFunction().toString(),
            "subTotal": controller.getFinalTotal().toString(),
            "qty": controller.cQTY.toString(),
          });
      if(response.statusCode == 200){
        var data = jsonEncode(response.body);
        print(data);
        print("Login Successfully");
      }else{
        print("Failed");
      };
    }catch(e){
      print(e.toString());
    }

  }
  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade500,
          leading: IconButton(
            onPressed: (){
              Get.to(
                ProductListScreen(),
                transition: Transition.fadeIn,
                duration: Duration(milliseconds: 700),
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
                                Text(
                                  "${controller.cartSubTotal}",
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                )
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
                                Obx(() =>  Text(
                                  "${controller.discountFeeFunction()}",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue.shade500),
                                )),
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
                                Text(
                                  "${controller.getFinalTotal()}",
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                )
                              ],
                            ),
                            const SizedBox(height: 25.0),
                            MaterialButton(
                              onPressed: (){
                                cartPost();
                                // print(controller.cQTY);
                                // print(controller.cID);
                                // print(controller.list);
                                // print(currentUserID);
                                // print(myProductID.toString());
                                // print(myProductQty.toString());
                                // print(controller.products.name);
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


