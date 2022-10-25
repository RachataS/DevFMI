import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FamilyScreen extends StatefulWidget {
  const FamilyScreen({Key? key}) : super(key: key);

  @override
  State<FamilyScreen> createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        //Group add button
        leading: IconButton(
          icon: const Icon(Icons.group_add),
          onPressed: () {},
        ),
        title: Text("Family"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Family"),
      ),
    );
  }
}
