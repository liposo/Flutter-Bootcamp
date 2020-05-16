import 'package:flutter/material.dart';

import 'theme.dart';
import 'widgets/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.getTheme(),
      home: InputPage(),
    );
  }
}
