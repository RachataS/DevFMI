import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Group add button
        leading: FlatButton(
          textColor: Colors.white,
          onPressed: () {},
          child: Icon(Icons.group_add),
        ),
        title: Text("Search Items"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Search"),
      ),
    );
  }
}
