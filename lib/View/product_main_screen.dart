import 'package:flutter/material.dart';
import 'package:fnf_project/View/product_list.dart';

import 'checkout_screen.dart';

class ProductMainScreen extends StatefulWidget {
  const ProductMainScreen({Key? key}) : super(key: key);

  @override
  State<ProductMainScreen> createState() => _ProductMainScreenState();
}

class _ProductMainScreenState extends State<ProductMainScreen> {

  List pages = [
    ProductListScreen(),
    ProductListScreen(),
    CheckoutScreen(),
  ];

  int selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 13,
        ),
        selectedLabelStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15),
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "Person",
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: "History",
            icon: Icon(
              Icons.history,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
