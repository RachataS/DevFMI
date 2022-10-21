import 'package:findmyitems/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:findmyitems/model/profile.dart';

class mainHomeScreen extends StatefulWidget {
  const mainHomeScreen({Key? key}) : super(key: key);

  @override
  State<mainHomeScreen> createState() => _mainHomeScreenState();
}

class _mainHomeScreenState extends State<mainHomeScreen> {
  Profile profile = Profile();
  HomeScreen home = HomeScreen();
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Find My Items'),
        centerTitle: true,
      ),
      floatingActionButton: TextButton(
        child: Text("Logout"),
        onPressed: () {},
      ),
      body: Center(child: Text("Welcome")),
    );
  }
}
