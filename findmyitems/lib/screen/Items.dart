import 'package:findmyitems/model/profile.dart';
import 'package:findmyitems/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  int currentIndex = 0;
  Profile profile = Profile();
  HomeScreen home = HomeScreen();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //Group add button
          leading: IconButton(
            icon: const Icon(Icons.group_add),
            onPressed: () {},
          ),
          title: Text("Items"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [TextFormField()],
          ),
        ));
  }
}
