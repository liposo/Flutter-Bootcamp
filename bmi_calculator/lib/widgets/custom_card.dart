import 'package:flutter/material.dart';

const borderRadius = 10.0;
const margin = 15.0;

class CustomCard extends StatelessWidget {
  CustomCard({@required this.color, this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
