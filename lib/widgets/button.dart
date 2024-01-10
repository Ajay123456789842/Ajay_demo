import 'package:demo/styles/get_text_style.dart';
import 'package:demo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    this.callback,
    this.child,
    this.label,
    this.height,
    this.width,
    this.color,
    this.applyPrimaryColor = false,
  }) : super(key: key);
  final Function? callback;
  final String? label;
  final double? height;
  final double? width;
  final Widget? child;
  final bool? applyPrimaryColor;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
            color ?? (applyPrimaryColor! ? Colors.black : Colors.transparent),
        // border: Border.all(),
      ),
      child: InkWell(
        onTap: () {
          callback?.call();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: child ??
                TextWidget(
                  '$label',
                  style: getTextStyle(
                    color: (!applyPrimaryColor! ? Colors.black : Colors.white),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
