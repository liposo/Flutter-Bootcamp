import 'package:flutter/material.dart';

import '../theme.dart';
import 'custom_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: CustomTheme.cardBackground,
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: CustomTheme.cardBackground,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              color: CustomTheme.cardBackground,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: CustomTheme.cardBackground,
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: CustomTheme.cardBackground,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
