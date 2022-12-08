// ignore_for_file: deprecated_member_use

import 'package:findmyitems/screen/Family.dart';
import 'package:findmyitems/screen/Items.dart';
import 'package:findmyitems/screen/Menu.dart';
import 'package:findmyitems/screen/Search.dart';
import 'package:findmyitems/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:findmyitems/model/profile.dart';
import 'package:google_sign_in/google_sign_in.dart';

class mainHomeScreen extends StatefulWidget {
  const mainHomeScreen({Key? key}) : super(key: key);

  @override
  State<mainHomeScreen> createState() => _mainHomeScreenState();
}

class _mainHomeScreenState extends State<mainHomeScreen> {
  int currentIndex = 0;
  Profile profile = Profile();
  HomeScreen home = HomeScreen();
  final auth = FirebaseAuth.instance;
  //seclect screen
  final screens = [
    ItemsScreen(),
    SearchScreen(),
    FamilyScreen(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      /*appBar: AppBar(
        //Group add button
        leading: ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.group_add),
        ),
        title: Text('Find My Items'),
        centerTitle: true,
        //logout button
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              logout().then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) {
                  return HomeScreen();
                })));
              });
            },
            child: Icon(Icons.logout),
          ),
        ],
      ),*/
      body: screens[currentIndex],
      //Bottommenubar
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.teal),
          BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: "Family",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "Menu",
              backgroundColor: Colors.blue)
        ],
      ),
    );
  }
}

//signout function
Future logout() async {
  await GoogleSignIn().disconnect();
  FirebaseAuth.instance.signOut();
}
