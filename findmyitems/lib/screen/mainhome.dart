// ignore_for_file: deprecated_member_use

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
  Profile profile = Profile();
  HomeScreen home = HomeScreen();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Find My Items'),
        //centerTitle: true,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              logout().then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) {
                  return HomeScreen();
                })));
              });
            },
            child: Text("Logout"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Column(children: [
        Text("${auth.currentUser?.email}"),
      ]),
    );
  }
}

Future logout() async {
  await GoogleSignIn().disconnect();
  FirebaseAuth.instance.signOut();
}
