import 'package:demo/styles/get_text_style.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? label;
  final TextStyle? style;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? breakSpaces;
  final bool? softWrap;
  const TextWidget(
    this.label, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.softWrap = true,
    this.breakSpaces = false,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      label!,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      textAlign: textAlign,
      style: style ?? getTextStyle(),
    );
  }
}
