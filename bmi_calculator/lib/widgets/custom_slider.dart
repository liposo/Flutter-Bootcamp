import 'package:flutter/material.dart';

import '../theme.dart';

const min = 120.0;
const max = 230.0;
const overlayAlpha = 0x29;
const thumbRadius = 15.0;
const overlayRadius = 30.0;
const trackHeight = 1.0;

class CustomSlider extends StatelessWidget {
  CustomSlider({@required this.value, @required this.onChange});

  final int value;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "HEIGHT",
          style: CustomTheme.regularTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              "$value",
              style: CustomTheme.largeTextStyle,
            ),
            Text(
              "cm",
              style: CustomTheme.smallTextStyle,
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: thumbRadius),
            overlayShape: RoundSliderOverlayShape(overlayRadius: overlayRadius),
            trackHeight: trackHeight,
            thumbColor: CustomTheme.activeColor,
            overlayColor: CustomTheme.activeColor.withAlpha(overlayAlpha),
            activeTrackColor: Colors.white,
            inactiveTrackColor: CustomTheme.textColor,
          ),
          child: Slider(
            value: this.value.toDouble(),
            min: min,
            max: max,
            onChanged: this.onChange,
          ),
        ),
      ],
    );
  }
}
