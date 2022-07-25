import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fnf_project/View/orders_detail_screen.dart';
import 'package:fnf_project/View/product_list.dart';
import 'package:fnf_project/View/user_profile_screen.dart';

import 'checkout_screen.dart';

class ProductMainScreen extends StatefulWidget {
  const ProductMainScreen({Key? key}) : super(key: key);

  @override
  State<ProductMainScreen> createState() => _ProductMainScreenState();
}

class _ProductMainScreenState extends State<ProductMainScreen> {

  List pages = [
    const UserProfileScreen(),
    const ProductListScreen(),
    const OrdersDetailScreen(),
  ];

  int selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


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
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: const Text('Yes'),
        ),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
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
          items: const [
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
      ),
    );
  }
}
