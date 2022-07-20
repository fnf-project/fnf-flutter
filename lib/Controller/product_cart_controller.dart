import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../Models/Product.dart';
import '../Utils/shared_preference.dart';

class CartController extends GetxController {
  // TODO Add a dictionary to store the products in the cart
  final _products = {}.obs;
  var cartItems = <Product>[].obs;
  var subsidy = Constants.preferences?.getInt('SubsidyPercentage').obs;
  get products => _products;



  var counter = 0.obs;

  // TODO For Calculating Sub Total of Products
  get productSubTotal => _products.entries.map((product) => product.key.price
      * product.value);
  get cartSubTotal => _products.entries.map((product) => product.key.price
      * product.value).toList()
      .reduce((value, element) => value + element);



  get pQTY => _products.entries.map((product) => product.value);
  get cQTY => _products.entries.map((product) => product.value).toList();
  get pID => _products.entries.map((product) => product.key.id);
  get cID => _products.entries.map((product) => product.key.id).toList();

  var productList = [];



  var subTotal = 0.obs;
  var subsidyAmount = 0.0.obs;
  var totalAmount = 0.0.obs;

  sumCart(){
   return subTotal.value = cartSubTotal;
  }

  discountFeeFunction() {
    return subsidyAmount.value = sumCart() * 0.25;
  }


    getFinalTotal() {
     return totalAmount.value = sumCart() - discountFeeFunction();
    }

    // TODO Add Product in the Dictionary
    void addProduct(Product product, context) {
      if (_products.containsKey(product)) {
        cartItems.add(product);
        _products[product] += 1;
      } else {
        _products[product] = 1;
      }
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("You have add ${product.name} to cart" ),
            dismissDirection: DismissDirection.horizontal,
            duration: const Duration(milliseconds: 400),
            backgroundColor: Colors.blue.shade500,
          )
      );
    }


    // TODO Remove Product From The Dictionary
    void removeProduct(Product product, context){
      if(_products.containsKey(product) && _products[product] == 1){
        _products.removeWhere((key, value) => key == product);
        if(counter > 0){
         counter--;
        }
      }else{
        _products[product] --;
      }

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("You have removed ${product.name} to cart" ),
            dismissDirection: DismissDirection.horizontal,
            duration: Duration(milliseconds: 400),
            backgroundColor: Colors.blue.shade500,
          )
      );

    }
  }

