// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class YourLibrary extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text('YourLibrary', style: TextStyle(fontSize: 40, color: Colors.yellow),));
  }
}