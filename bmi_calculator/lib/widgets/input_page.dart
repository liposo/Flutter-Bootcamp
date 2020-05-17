import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme.dart';
import 'custom_card.dart';
import 'icon_text.dart';

const bottomContainerHeight = 80.0;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTheme.getAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("!");
                    },
                    child: CustomCard(
                      child: IconText(
                        text: "MALE",
                        icon: FontAwesomeIcons.mars,
                      ),
                      color: CustomTheme.inactiveCardBackground,
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    child: IconText(
                      text: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                    color: CustomTheme.inactiveCardBackground,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              color: CustomTheme.activeCardBackground,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: CustomTheme.activeCardBackground,
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: CustomTheme.activeCardBackground,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: CustomTheme.bottomContainer,
            margin: EdgeInsets.only(
              top: 10.0,
            ),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
