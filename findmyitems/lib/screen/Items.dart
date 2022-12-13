import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findmyitems/model/Items.dart';
import 'package:findmyitems/model/profile.dart';
import 'package:findmyitems/screen/AddItem.dart';
import 'package:findmyitems/screen/ListItems.dart';
import 'package:findmyitems/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  //Method
  @override
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
      body: ListItemsScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddItemScreen();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
