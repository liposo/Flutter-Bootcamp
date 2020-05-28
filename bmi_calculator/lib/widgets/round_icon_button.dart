import 'package:bmicalculator/theme.dart';
import 'package:flutter/material.dart';

const elevation = 6.0;

const BoxConstraints sizeConstraints =
    BoxConstraints.tightFor(width: 56.0, height: 56.0);

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      constraints: sizeConstraints,
      fillColor: CustomTheme.roundButtonColor,
      elevation: elevation,
      onPressed: this.onPress,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
