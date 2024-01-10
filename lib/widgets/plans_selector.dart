import 'package:demo/model/plan_model.dart';
import 'package:demo/styles/get_text_style.dart';
import 'package:flutter/material.dart';

import 'package:demo/widgets/text_widget.dart';

class PlansSelector extends StatefulWidget {
  const PlansSelector({
    Key? key,
    required this.planModel,
  }) : super(key: key);
  final Plans? planModel;

  @override
  State<PlansSelector> createState() => _PlansSelectorState();
}

class _PlansSelectorState extends State<PlansSelector> {
  RangeValues _currentRangeValues = const RangeValues(0, 100);
  final RangeValues _defaultRangeValues = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextWidget(
          widget.planModel!.name,
          style: getTextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        RangeSlider(
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          values: _currentRangeValues,
          max: _defaultRangeValues.end,
          divisions: 5,
          labels: RangeLabels(
            '${_currentRangeValues.start.round()}GB',
            '${_currentRangeValues.end.round()}GB',
          ),
          onChanged: (RangeValues values) {
            setState(
              () {
                _currentRangeValues = values;
              },
            );
          },
        ),
      ],
    );
  }
}
