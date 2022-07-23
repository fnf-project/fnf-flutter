import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Utils/shared_preference.dart';


class OrdersDetailScreen extends StatefulWidget {
  const OrdersDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrdersDetailScreen> createState() => _OrdersDetailScreenState();
}

// TODO GETTING TOKEN
var orderToken = Constants.preferences?.getString('Token');

var data;
Future<void> getPostApi() async{
  final response = await http.get(
      Uri.parse('http://192.168.100.240:5000/api/myorders/'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Token ${orderToken}'
    },
  );
  data = jsonDecode(response.body);
  if (response.statusCode == 200){
    print("Successfully Get Data");
    print(data);
  }else{
    print("Failed");
  }
  return data;
}

class _OrdersDetailScreenState extends State<OrdersDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
       title: const Text(
           "Orders Details",
         style: TextStyle(
           fontSize: 17, fontWeight: FontWeight.bold
         ),
       ),
      ),
      body: Column(
        children:  [
          // FutureBuilder(
          //   future: getOrdersDetails(context),
          //   builder: (context, snapshot){
          //     if(snapshot.connectionState == ConnectionState.waiting){
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }else{
          //       return Column(
          //         children: [
          //           Card(
          //             shadowColor: Colors.grey,
          //             shape: RoundedRectangleBorder(
          //               side: BorderSide(
          //                   color: Colors.grey.shade200, width: 2.0),
          //             ),
          //             child: ExpansionTile(
          //               backgroundColor: Colors.blue,
          //               title: Text("Order ID : ${4}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          //               children: [
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Product Name",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 60,),
          //                     Text("Dalda Ghee Oil", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Product ID's",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 75,),
          //                     Text("1,2,3", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Total Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 67,),
          //                     Text("200", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Discount Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 44,),
          //                     Text("50", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Subtotal Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 46,),
          //                     Text("150", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Card(
          //             shadowColor: Colors.grey,
          //             shape: RoundedRectangleBorder(
          //               side: BorderSide(
          //                   color: Colors.grey.shade200, width: 2.0),
          //             ),
          //             child: ExpansionTile(
          //               backgroundColor: Colors.blue,
          //               title: Text("Order ID : ${4}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          //               children: [
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Product Name",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 60,),
          //                     Text("Dalda Ghee Oil", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Product ID's",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 75,),
          //                     Text("1,2,3", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Total Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 67,),
          //                     Text("200", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Discount Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 44,),
          //                     Text("50", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Subtotal Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 46,),
          //                     Text("150", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Card(
          //             shadowColor: Colors.grey,
          //             shape: RoundedRectangleBorder(
          //               side: BorderSide(
          //                   color: Colors.grey.shade200, width: 2.0),
          //             ),
          //             child: ExpansionTile(
          //               backgroundColor: Colors.blue,
          //               title: Text("Order ID : ${4}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          //               children: [
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Product Name",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 60,),
          //                     Text("Dalda Ghee Oil", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Product ID's",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 75,),
          //                     Text("1,2,3", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Total Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 67,),
          //                     Text("200", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Discount Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 44,),
          //                     Text("50", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Subtotal Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 46,),
          //                     Text("150", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Card(
          //             shadowColor: Colors.grey,
          //             shape: RoundedRectangleBorder(
          //               side: BorderSide(
          //                   color: Colors.grey.shade200, width: 2.0),
          //             ),
          //             child: ExpansionTile(
          //               backgroundColor: Colors.blue,
          //               title: Text("Order ID : ${4}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          //               children: [
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Product Name",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 60,),
          //                     Text("Dalda Ghee Oil", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Product ID's",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 75,),
          //                     Text("1,2,3", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Total Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 67,),
          //                     Text("200", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Discount Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 44,),
          //                     Text("50", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Subtotal Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 46,),
          //                     Text("150", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Card(
          //             shadowColor: Colors.grey,
          //             shape: RoundedRectangleBorder(
          //               side: BorderSide(
          //                   color: Colors.grey.shade200, width: 2.0),
          //             ),
          //             child: ExpansionTile(
          //               backgroundColor: Colors.blue,
          //               title: Text("Order ID : ${4}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          //               children: [
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Product Name",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 60,),
          //                     Text("Dalda Ghee Oil", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Product ID's",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 75,),
          //                     Text("1,2,3", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Total Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 67,),
          //                     Text("200", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Discount Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 44,),
          //                     Text("50", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Subtotal Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 46,),
          //                     Text("150", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Card(
          //             shadowColor: Colors.grey,
          //             shape: RoundedRectangleBorder(
          //               side: BorderSide(
          //                   color: Colors.grey.shade200, width: 2.0),
          //             ),
          //             child: ExpansionTile(
          //               backgroundColor: Colors.blue,
          //               title: Text("Order ID : ${4}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          //               children: [
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Product Name",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 60,),
          //                     Text("Dalda Ghee Oil", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Product ID's",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 75,),
          //                     Text("1,2,3", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Total Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 67,),
          //                     Text("200", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Discount Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 44,),
          //                     Text("50", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: const [
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 25.0),
          //                       child: Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "Subtotal Amount",
          //                             style: TextStyle(
          //                                 color: Colors.white, fontWeight: FontWeight.bold),
          //                           )),
          //                     ),
          //                     SizedBox(width: 46,),
          //                     Text("150", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       );
          //     }
          //   },
          // )
          FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Text("Loading");
                }else{
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index){
                        return Column(
                          children: [
                            Card(
                              shadowColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.grey.shade200, width: 2.0),
                              ),
                              child: ExpansionTile(
                                backgroundColor: Colors.blue,
                                title: Text("Order ID : ${data[index]['id'].toString()}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                children: [
                                  // Row(
                                  //   children: const [
                                  //     Padding(
                                  //       padding: EdgeInsets.only(left: 25.0),
                                  //       child: Align(
                                  //           alignment: Alignment.topLeft,
                                  //           child: Text(
                                  //             "Product Name",
                                  //             style: TextStyle(
                                  //                 color: Colors.white, fontWeight: FontWeight.bold),
                                  //           )),
                                  //     ),
                                  //     SizedBox(width: 60,),
                                  //     Text("Dalda Ghee Oil", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                                  //   ],
                                  // ),
                                  // Row(
                                  //   children: const [
                                  //     Padding(
                                  //       padding: EdgeInsets.only(left: 25.0),
                                  //       child: Align(
                                  //           alignment: Alignment.topLeft,
                                  //           child: Text(
                                  //             "Product ID's",
                                  //             style: TextStyle(
                                  //                 color: Colors.white, fontWeight: FontWeight.bold),
                                  //           )),
                                  //     ),
                                  //     SizedBox(width: 75,),
                                  //     Text("1,2,3", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                                  //   ],
                                  // ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 25.0),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Total Amount",
                                              style: TextStyle(
                                                  color: Colors.white, fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                      const SizedBox(width: 67,),
                                      Text(data[index]['total'].toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 25.0),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Discount Amount",
                                              style: TextStyle(
                                                  color: Colors.white, fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                      const SizedBox(width: 44,),
                                      Text(data[index]['discount'].toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 25.0),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Subtotal Amount",
                                              style: TextStyle(
                                                  color: Colors.white, fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                      const SizedBox(width: 46,),
                                      Text(data[index]['subTotal'].toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 25.0),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Status Order",
                                              style: TextStyle(
                                                  color: Colors.white, fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                      const SizedBox(width: 75,),
                                      Text(data[index]['status'].toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                                    ],
                                  ),
                                  ExpansionTile(
                                    backgroundColor: Colors.white,
                                    title: const Text("Products", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),),
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 25.0),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Product Name",
                                                  style: TextStyle(
                                                      color: Colors.black87, fontWeight: FontWeight.bold),
                                                )),
                                          ),
                                          const SizedBox(width: 60,),
                                          Text(data[index]['id'].toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(left: 25.0),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Product ID's",
                                                  style: TextStyle(
                                                      color: Colors.black87, fontWeight: FontWeight.bold),
                                                )),
                                          ),
                                          SizedBox(width: 75,),
                                          Text("1,2,3", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                        ;
                      },
                    ),
                  );
                }
              }
          ),

        ],
      ),
    );
  }
}
