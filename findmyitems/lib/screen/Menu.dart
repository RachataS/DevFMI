import 'package:findmyitems/model/profile.dart';
import 'package:findmyitems/screen/home.dart';
import 'package:findmyitems/screen/mainhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int currentIndex = 0;
  Profile profile = Profile();
  HomeScreen home = HomeScreen();
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Group add button
        leading: ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.group_add),
        ),
        title: Text("Menu"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          //logout button
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: SizedBox(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(user.photoURL!),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: SizedBox(
                      child: Text(
                        user.displayName!,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
                    child: SizedBox(
                      child: Text(user.email!, style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        logout().then((value) {
                          Fluttertoast.showToast(
                              msg: "ออกจากระบบสำเร็จ",
                              gravity: ToastGravity.TOP);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
                        });
                      },
                      icon: Icon(Icons.logout),
                      label: Text("Logout"),
                    ),
                  ),
                ],
              ))
        ],
      )),
    );
  }
}

Future logout() async {
  await GoogleSignIn().disconnect();
  FirebaseAuth.instance.signOut();
}
