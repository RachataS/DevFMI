import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class mainHomeScreen extends StatefulWidget {
  const mainHomeScreen({Key? key}) : super(key: key);

  @override
  State<mainHomeScreen> createState() => _mainHomeScreenState();
}

class _mainHomeScreenState extends State<mainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Find My Items')),
    );
  }
}
