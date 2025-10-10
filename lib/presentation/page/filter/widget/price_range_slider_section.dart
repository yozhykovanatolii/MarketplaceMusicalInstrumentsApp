import 'package:flutter/material.dart';

class PriceRangeSliderSection extends StatefulWidget {
  const PriceRangeSliderSection({super.key});

  @override
  State<PriceRangeSliderSection> createState() =>
      _PriceRangeSliderSectionState();
}

class _PriceRangeSliderSectionState extends State<PriceRangeSliderSection> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          '\$${_currentRangeValues.start} - \$${_currentRangeValues.end}',
          style: TextStyle(
            fontSize: MediaQuery.textScalerOf(context).scale(18),
            fontWeight: FontWeight.w500,
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xFF007DFC),
            inactiveTrackColor: Colors.grey[300],
            thumbColor: const Color(0xFF007DFC),
            overlayShape: SliderComponentShape.noOverlay,
            trackHeight: 6,
          ),
          child: RangeSlider(
            values: _currentRangeValues,
            max: 200,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
        ),
      ],
    );
  }
}
