// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:demo/styles/get_text_style.dart';
import 'package:demo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    this.controller,
    this.label,
    this.onSubmit,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? label;
  final Function(String)? onSubmit;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  Timer? _debounce;
  void checkNvalidate(String _) async {
    //  Timer? _debounce;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 1000),
      () async {
        //
        debugPrint('current String is $_');
        widget.onSubmit?.call(_);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          // fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          hintText: widget.label,
          hintStyle: getTextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          // label: TextWidget(
          //   '${widget.label}',
          //   style: getTextStyle(
          //     color: Colors.grey,
          //     fontSize: 15,
          //   ),
          // ),
        ),
        onChanged: (_) async {
          //

          checkNvalidate(_);
        },
      ),
    );
  }
}
