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
        //Group add button
        leading: ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.group_add),
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
