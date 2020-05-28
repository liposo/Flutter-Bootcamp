import 'package:bmicalculator/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme.dart';

const spaceBetween = 10.0;

class CustomIncrement extends StatelessWidget {
  CustomIncrement(
      {this.title,
      this.subText,
      this.value,
      this.incrementAction,
      this.decrementAction});

  final String title;
  final String subText;
  final int value;
  final Function incrementAction;
  final Function decrementAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: CustomTheme.regularTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value.toString(),
              style: CustomTheme.largeTextStyle,
            ),
            Text(
              subText != null ? subText : "",
              style: CustomTheme.smallTextStyle,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: decrementAction,
            ),
            SizedBox(
              width: spaceBetween,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: incrementAction,
            ),
          ],
        )
      ],
    );
  }
}
