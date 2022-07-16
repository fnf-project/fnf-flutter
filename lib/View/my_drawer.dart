import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  var name, username, address, phoneNumber;
  int? familyMembers;
  MyDrawer({this.name, this.username, this.address, this.phoneNumber, this.familyMembers});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue.shade500,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blue.shade500),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white70,
            ),
            accountName: Text("Shakeeb Ahmed Khan", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 17),),
            accountEmail: Text("Shaki", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
          ),
          const Divider(thickness: 1.5, color: Colors.grey,),
          const SizedBox(height: 25.0,),
          const ListTile(
            leading: Icon(Icons.home, color: Colors.white,),
            title: Text("Home", style: TextStyle(color: Colors.white),),
          ),
          const SizedBox(height: 10.0,),
          const ListTile(
            leading: Icon(Icons.person, color: Colors.white,),
            title: Text("Personal Details", style: TextStyle(color: Colors.white),),
          ),
          const SizedBox(height: 10.0,),
          const ListTile(
            leading: Icon(Icons.history_sharp, color: Colors.white,),
            title: Text("History", style: TextStyle(color: Colors.white),),
          ),
          const SizedBox(height: 10.0,),
          const ListTile(
            leading: Icon(Icons.logout, color: Colors.white,),
            title: Text("Logout", style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}