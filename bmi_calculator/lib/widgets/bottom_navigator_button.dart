import 'package:flutter/material.dart';

import '../theme.dart';

class BottomNavigatorButton extends StatelessWidget {
  BottomNavigatorButton({@required this.title, @required this.pageToGo});

  final String title;
  final Widget pageToGo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => pageToGo)),
      },
      child: Container(
        color: CustomTheme.bottomContainer,
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        width: double.infinity,
        height: CustomTheme.bottomContainerHeight,
        child: Center(
          child: Text(
            this.title,
            style: CustomTheme.bottomTextStyle,
          ),
        ),
      ),
    );
  }
}
