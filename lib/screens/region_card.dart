// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demo/styles/get_text_style.dart';
import 'package:demo/widgets/button.dart';
import 'package:flutter/material.dart';

import 'package:demo/widgets/text_widget.dart';

class RegionCard extends StatelessWidget {
  const RegionCard({
    Key? key,
    this.label,
    this.subTitle,
    this.callback,
  }) : super(key: key);
  final String? label;
  final String? subTitle;
  final VoidCallback? callback;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: MyButton(
        callback: callback,
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            Card(
              // color: Colors.amber,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                height: 100,
                child: const FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                ),
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //

                TextWidget(
                  label,
                  style: getTextStyle(fontSize: 20, color: Colors.black),
                ),
                TextWidget(
                  '${label!.toUpperCase()} ..............',
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  style: getTextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Spacer(),

            const Icon(
              Icons.arrow_right,
              size: 50,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
