import 'package:findmyitems/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../model/profile.dart';

class RealHomeScreen extends StatefulWidget {
  const RealHomeScreen({Key? key}) : super(key: key);

  @override
  State<RealHomeScreen> createState() => _RealHomeScreenState();
}

class _RealHomeScreenState extends State<RealHomeScreen> {
  int currentIndex = 0;
  Profile profile = Profile();
  HomeScreen home = HomeScreen();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text("Find My Items")),
        body: Center(
      child: Text("Home"),
    ));
  }
}
