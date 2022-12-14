import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findmyitems/model/Items.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:sflutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class ListItemsScreen extends StatefulWidget {
  const ListItemsScreen({super.key});

  @override
  State<ListItemsScreen> createState() => _ListItemsScreenState();
}

class _ListItemsScreenState extends State<ListItemsScreen> {
  ItemsModel _itemsModel = ItemsModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<ItemsModel>>(
        stream: readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final itemsModel = snapshot.data!;

            return ListView(
              children: itemsModel.map(buildItems).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Stream<List<ItemsModel>> readItems() => FirebaseFirestore.instance
      .collection('Items')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((docs) => ItemsModel.fromJson(docs.data()))
          .toList());

  Widget buildItems(ItemsModel itemsModel) => ListTile(
        leading: CircleAvatar(child: Image.network(itemsModel.image)),
        title: Text(itemsModel.name),
        subtitle: Text('${itemsModel.detail}\n${itemsModel.date_time}'),
      );
}
