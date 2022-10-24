import 'package:findmyitems/model/logincheck.dart';
import 'package:findmyitems/model/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GoogleProfileScreen extends StatefulWidget {
  const GoogleProfileScreen({super.key});

  @override
  State<GoogleProfileScreen> createState() => _GoogleProfileScreenState();
}

class _GoogleProfileScreenState extends State<GoogleProfileScreen> {
  Logincheck check = Logincheck();
  Profile profile = Profile();
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Profile")),
        body: Center(
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
            ],
          ),
        ));
  }
}
