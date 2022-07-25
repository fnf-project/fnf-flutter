import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: const Text("Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),),
      ),
      body: const Center(
        child: Text("User Profile Screen"),
      ),
    );
  }
}
