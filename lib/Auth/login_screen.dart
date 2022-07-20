import 'package:flutter/material.dart';
import 'package:fnf_project/View/product_list.dart';
import 'package:get/route_manager.dart';
import 'package:hovering/hovering.dart';
import 'dart:convert';
import 'package:http/http.dart';
import '../Utils/shared_preference.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}


class _SignInScreenState extends State<SignInScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  // TODO LOGIN THROUGH SERVER API
  bool isLoading = false;
  login(String username, password)async{
    try{
      var response = await post(
          Uri.parse('http://192.168.100.249:8081/api/login/'),
          body: {
            "username": username,
            "password": password,
          });
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data);
        data["username"];
        print(data["name"]);
        print(data["phone_number"]);
        print(data["address"]);
        print(data["token"]);
        print("Login Successfully");
        setState(() => isLoading = true);
        Constants.preferences!.setBool("loggedIn", true);
        Constants.preferences?.setString('Token', data['token']);
        Constants.preferences?.setInt('USERID', data['userId']);
        Constants.preferences?.setInt('SubsidyPercentage', data['subsidy_percentage']);
        Constants.preferences?.setString('Username', data['name']);
        setState(() {
          isLoading = true;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductListScreen(
        )));
      }else{
        print("Failed");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Failed")));
      }
      setState(() {
        isLoading = false;
      });
    }catch(e){
      print(e.toString());
      Get.snackbar(
        'Network Error',
        e.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return isLoading ? CircularProgressIndicator() : Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Image.asset("assets/images/login.gif", height: 250,),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: usernameController,
                validator: (val) {
                  if(val.toString().isEmpty){
                    return "Please Enter Your Name";
                  } else if(val.toString().length < 3){
                    return "Name is too small";
                  } else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter Your Username",
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.blue.shade500),
                  prefixIcon: Icon(Icons.email),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (val) {
                  if(val.toString().isEmpty){
                    return "Please Enter Your Password";
                  } else if(val.toString().length < 4){
                    return "Password is too small";
                  } else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.blue.shade500),
                  prefixIcon: Icon(Icons.lock),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 1.0),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.blue.shade500,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: MaterialButton(
                onPressed: (){
                  if(formKey.currentState!.validate()){
                    // ignore: void_checks
                    return login(
                      usernameController.text.toString(),
                      passwordController.text.toString(),
                    );
                  } else{
                    return null;
                  }
                },
                height: 50,
                color: Colors.blue.shade500,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade200, width: 1.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text("LOG IN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 45.0),
              child: Text(
                "If you don't have account! Register Yourself",
                style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 25.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: MaterialButton(
                onPressed: (){},
                height: 50,
                color: Colors.blue.shade500,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade200, width: 1.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text("SIGN UP", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}