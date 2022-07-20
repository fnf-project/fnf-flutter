import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fnf_project/Auth/login_screen.dart';
import 'package:fnf_project/Models/Product.dart';
import 'package:fnf_project/Utils/shared_preference.dart';
import 'package:fnf_project/View/checkout_screen.dart';
import 'package:fnf_project/Controller/product_cart_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../Models/CartModel.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final CartController cartController = Get.put(CartController());

  // TODO GETTING TOKEN
  var token = Constants.preferences?.getString('Token');




  // TODO GETTING THE PRODUCTS FROM SERVER
  var data;
  List<Product> productList = [];
  List<Products> cartItems = [];
  Future<List<Product>> getProductsList() async{
    final response = await http.get(
      Uri.parse('http://192.168.100.249:8081/api/products/'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Token ${token}'
    },
    );
     data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      print("Data Get Successfully");
      for(Map i in data){
        productList.add(Product.fromJson(i));
      }
      return productList;
    }else{
      print("Failed");

      return productList;
    }
  }

  // TODO PREVENT FROM CLOSING THE APP ACCIDENTALLY
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
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: const Text('Yes'),
        ),
      ],
    );
  }


  // TODO LOGOUT CONFIRM FUNCTION
  logoutFunction(){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: const Padding(
              padding: EdgeInsets.only(left: 12.0),
                child: Text("Do you want to logout?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),)),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Colors.redAccent,
                    onPressed: (){
                      Constants.preferences?.setBool("loggedIn", false);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                    },
                    child: const Text("Yes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                  MaterialButton(
                    color: Colors.green,
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductListScreen()));
                    },
                    child: const Text("No", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  )
                ],
              )
            ],
          );
        }
    );
  }


  // int counter = 0;
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade500,
          title: const Text(
            "Product List",
            style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            GestureDetector(
              onTap: (){
                Get.to(
                  CheckoutScreen(),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 1000),
                );
              },
              child: Badge(
                badgeContent: Text(
                  cartController.counter.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                child: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 25,),
                badgeColor: Colors.redAccent,
                position: BadgePosition.topStart(top: -0.3),
                animationType: BadgeAnimationType.scale,
              ),
            ),
            const SizedBox(width: 15,),
            IconButton(
              onPressed: (){
                logoutFunction();
              },
              icon: const Icon(Icons.logout, color: Colors.white, size: 25,),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getProductsList(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }else{
                      return ListView.builder(
                        itemCount: productList.length,
                        itemBuilder: (context, index){
                          return Card(
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.grey.shade200, width: 2.0),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,  vertical: 10),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      productList[index].name.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    subtitle: Text(
                                      productList[index].price.toString() + " " +"Rs",
                                    ),
                                    trailing: MaterialButton(
                                      onPressed: (){
                                        cartController.addProduct(productList[index], context);
                                        setState(() {
                                          cartController.counter++;
                                        });
                                      },
                                      color: Colors.blue.shade500,
                                      child: const Text("Add to Cart", style: TextStyle(color: Colors.white),),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),

        // bottomNavigationBar: CurvedNavigationBar(
        //   backgroundColor: Colors.white,
        //   color: Colors.blue.shade500,
        //   animationCurve: Curves.easeOut,
        //   height: 50,
        //   items: const [
        //     Icon(Icons.person, color: Colors.white,),
        //     Icon(Icons.home, color: Colors.white,),
        //     Icon(Icons.history, color: Colors.white,),
        //   ],
        //
        // )
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 13,),
          selectedLabelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15),
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.blue,
          currentIndex: selectedIndex,
          onTap: (int index){
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Person",
              icon: Icon(Icons.person, color: Colors.white,),
            ),
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home, color: Colors.white,),
            ),
            BottomNavigationBarItem(
              label: "History",
              icon: Icon(Icons.history, color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
