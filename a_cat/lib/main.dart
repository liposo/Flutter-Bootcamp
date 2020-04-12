import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("A Cat"),
        backgroundColor: Colors.grey.shade900,
      ),
      body: Center(
        child: Image(
          image: AssetImage("images/cat.png"),
        ),
      ),
    ),
  ));
}
