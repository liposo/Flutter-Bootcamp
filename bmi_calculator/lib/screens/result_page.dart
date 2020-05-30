import 'package:bmicalculator/theme.dart';
import 'package:bmicalculator/widgets/bottom_navigator_button.dart';
import 'package:bmicalculator/widgets/custom_card.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

const padding = 15.0;

class ResultPage extends StatelessWidget {
  ResultPage({this.result});

  final result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTheme.appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(padding),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: CustomTheme.largeTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomCard(
              color: CustomTheme.activeCardBackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Normal",
                    style: CustomTheme.resultTextStyle,
                  ),
                  Text(
                    "24.5",
                    style: CustomTheme.largeTextStyle,
                  ),
                  Text(
                    "Text about your BMI...etc etc etc",
                    style: CustomTheme.regularTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomNavigatorButton(
            title: "Recalculate",
            pageToGo: InputPage(),
          ),
        ],
      ),
    );
  }
}
