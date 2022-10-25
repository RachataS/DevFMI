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
      appBar: AppBar(title: Text("Profile"),centerTitle: true,),
      
    );
  }
}