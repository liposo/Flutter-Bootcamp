import 'package:flutter/material.dart';

import '../theme.dart';

const textStyle = TextStyle(
  fontSize: 18.8,
  color: CustomTheme.textColor,
);

const iconSize = 80.0;
const sizedBoxHeight = 15.0;

class IconText extends StatelessWidget {
  IconText({@required this.text, @required this.icon});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          size: iconSize,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          this.text,
          style: textStyle,
        ),
      ],
    );
  }
}
