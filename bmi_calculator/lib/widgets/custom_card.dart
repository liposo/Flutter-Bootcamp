import 'package:flutter/material.dart';

const borderRadius = 10.0;
const margin = 15.0;

class CustomCard extends StatelessWidget {
  CustomCard({@required this.color, this.child, this.onTap});

  final Color color;
  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: this.child,
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
