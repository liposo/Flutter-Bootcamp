import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Position position;
  String positionAsString;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    position = await Geolocator().getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    print(position);
    //Low accuracy will reduce battery usage.
    setState(() {
      positionAsString = position.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(position != null ? positionAsString : "Getting location...")
          ],
        ),
      ),
    );
  }
}
