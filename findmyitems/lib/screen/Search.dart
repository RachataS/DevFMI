import 'package:animated_search_bar/animated_search_bar.dart';
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
      backgroundColor: Colors.teal,
      //Group add button
      leading: IconButton(
        icon: const Icon(Icons.group_add),
        onPressed: () {},
      ),
      title: //Text("Search Items"),
          // ignore: prefer_const_constructors
          AnimatedSearchBar(
        label: "Search Items",
        //controller: _controller,
        labelStyle: TextStyle(fontSize: 16),
        searchStyle: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        searchDecoration: InputDecoration(
          hintText: "Search",
          alignLabelWithHint: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
        //centerTitle: true,
      ),
    ));
  }
}
