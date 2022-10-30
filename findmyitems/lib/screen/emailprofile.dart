import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findmyitems/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmailProfileScreen extends StatefulWidget {
  const EmailProfileScreen({super.key});

  @override
  State<EmailProfileScreen> createState() => _EmailProfileScreenState();
}

class _EmailProfileScreenState extends State<EmailProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Profile").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
              children: snapshot.data!.docs.map((File) {
            return Container(
                child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: SizedBox(
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/favicon.png"),
                        backgroundColor: Colors.blue,
                        radius: 50,
                      ),
                    ),
                  )
                ],
              ),
            ));
          }).toList());
        },
      ),
    );
  }
}
