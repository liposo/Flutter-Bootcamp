import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("images/avatar.jpg"),
            ),
            Text(
              "Felipe Z. Bourscheid",
              style: TextStyle(
                  fontFamily: "Pacifico",
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "LEARNING FLUTTER",
              style: TextStyle(
                  color: Colors.teal.shade100,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Colors.teal,
                ),
                title: Text(
                  "my@mail.com",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.teal.shade900),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.skype,
                  color: Colors.teal,
                ),
                title: Text(
                  "skypeUsername",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.teal.shade900),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.github,
                  color: Colors.teal,
                ),
                title: Text(
                  "liposo",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.teal.shade900),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
