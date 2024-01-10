import 'package:demo/model/plan_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SfRangeSelector extends StatefulWidget {
  const SfRangeSelector({
    Key? key,
    this.callback,
    this.planModel,
    required this.label,
  }) : super(key: key);
  final String? label;
  final Plans? planModel;
  final Function(Plans)? callback;
  @override
  State<SfRangeSelector> createState() => _SfRangeSelectorState();
}

class _SfRangeSelectorState extends State<SfRangeSelector> {
  double? value = 5;
  @override
  Widget build(BuildContext context) {
    return SfSlider(
      labelPlacement: LabelPlacement.onTicks,
      enableTooltip: true,
      min: 0.0,
      shouldAlwaysShowTooltip: true,
      showDividers: true,
      max: 20,
      interval: 5,
      showLabels: true,
      showTicks: true,
      value: value,
      onChanged: (dynamic newValue) {
        debugPrint('aswertyuiop$newValue');
        setState(
          () {
            value = newValue;
          },
        );
        widget.callback?.call(
          Plans(
            name: widget.label,
            range: value,
          ),
        );
      },
    );
  }
}
