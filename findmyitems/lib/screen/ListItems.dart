import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findmyitems/model/Items.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class ListItemsScreen extends StatefulWidget {
  const ListItemsScreen({super.key});

  @override
  State<ListItemsScreen> createState() => _ListItemsScreenState();
}

class _ListItemsScreenState extends State<ListItemsScreen> {
  //Field
  List<ItemsModel> itemsModels = [];

  //Medhod
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference = firestore.collection("Items");
    await collectionReference.snapshots().listen((response) {
      List<DocumentSnapshot> snapshots = response.docs;

      for (var snapshot in snapshots) {
        print('data = ');

        /*ItemsModel itemsModel = ItemsModel.fromMap(snapshot.data());
        setState(() {
          itemsModels.add(itemsModel);
        });*/
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: itemsModels.length,
          itemBuilder: ((BuildContext buildContext, int index) {
            return Text(itemsModels[index].name);
          })),
    );
  }
}
