import 'package:flutter/material.dart';
import 'package:fnf_project/Utils/shared_preference.dart';
import 'package:fnf_project/View/product_list.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Auth/login_screen.dart';
import 'View/product_main_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Constants.preferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friend and Family',
      home: Constants.preferences?.getBool("loggedIn") == true
        ? ProductMainScreen()
          : SignInScreen(),
    );
  }
}
