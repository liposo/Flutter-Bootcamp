import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme.dart';
import 'custom_card.dart';
import 'custom_slider.dart';
import 'icon_text.dart';

const bottomContainerHeight = 80.0;
enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;

  void switchGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void setSliderValue(double value) {
    setState(() {
      height = value.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTheme.appBar,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    child: IconText(
                      text: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                    color: selectedGender == Gender.MALE
                        ? CustomTheme.activeCardBackground
                        : CustomTheme.inactiveCardBackground,
                    onTap: () {
                      switchGender(Gender.MALE);
                    },
                  ),
                ),
                Expanded(
                  child: CustomCard(
                      child: IconText(
                        text: "FEMALE",
                        icon: FontAwesomeIcons.venus,
                      ),
                      color: selectedGender == Gender.FEMALE
                          ? CustomTheme.activeCardBackground
                          : CustomTheme.inactiveCardBackground,
                      onTap: () {
                        switchGender(Gender.FEMALE);
                      }),
                )
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              color: CustomTheme.activeCardBackground,
              child: CustomSlider(
                  value: height,
                  onChange: (double newValue) => {setSliderValue(newValue)}),
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
