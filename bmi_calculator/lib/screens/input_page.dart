import 'package:bmicalculator/widgets/bottom_navigator_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_increment.dart';
import '../widgets/custom_slider.dart';
import '../widgets/icon_text.dart';
import 'result_page.dart';

enum Gender { MALE, FEMALE }
enum IncrementType { ADD, SUBTRACT }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

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

  void changeWeight(IncrementType type) {
    setState(() {
      type == IncrementType.ADD ? weight++ : weight--;
    });
  }

  void changeAge(IncrementType type) {
    setState(() {
      type == IncrementType.ADD ? age++ : age--;
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
                    child: CustomIncrement(
                      title: "WEIGHT",
                      subText: "Kg",
                      value: weight,
                      incrementAction: () => {changeWeight(IncrementType.ADD)},
                      decrementAction: () =>
                          {changeWeight(IncrementType.SUBTRACT)},
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: CustomTheme.activeCardBackground,
                    child: CustomIncrement(
                      title: "AGE",
                      value: age,
                      incrementAction: () => {changeAge(IncrementType.ADD)},
                      decrementAction: () =>
                          {changeAge(IncrementType.SUBTRACT)},
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomNavigatorButton(
            title: "Calculate",
            pageToGo: ResultPage(),
          ),
        ],
      ),
    );
  }
}
