import 'package:flutter/material.dart';
import 'package:fnf_project/Models/Product.dart';
import 'package:fnf_project/Controller/product_cart_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class CheckoutCatalog extends StatelessWidget {
  final CartController controller = Get.find();
  CheckoutCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => SizedBox(
          height: 600,
          child: ListView.builder(
            itemCount:controller.products.length,
            itemBuilder: (context, index){
              return CheckoutCatalogCard(
                controller: controller,
                products: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
                index: index,
              );
            },
          ),
        ),
        ),
        const Divider(color: Colors.black38, thickness: 1.4,),

      ],
    );
  }
}


class CheckoutCatalogCard extends StatelessWidget {
  final CartController controller;
  final Product products;
  final int quantity;
  final int index;

  const CheckoutCatalogCard({Key? key, required this.controller,
    required this.products, required this.quantity, required this.index })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 20,),
                Expanded(
                  child: Text(products.name.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                Text('Qty  :  ${quantity}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black87),),
              ],
            ),
            const SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                  child: Text("Rs" + " " + products.price.toString(), style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 17),)),
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 35,
                  width: 125,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      controller.addProduct(products, context);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.add_circle, color: Colors.green,),
                      SizedBox(width: 10,),
                      Text("ADD", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                      ],
                    )
                  ),
                  ),
                Container(
                  height: 35,
                  width: 125,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.redAccent, width: 1.0),
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: MaterialButton(
                    onPressed: (){
                            controller.removeProduct(products, context);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.remove_circle, color: Colors.red,),
                        SizedBox(width: 10,),
                        Text("REMOVE", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                      ],
                    )
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
