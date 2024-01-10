import 'package:demo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BuildWelcomeNote extends StatelessWidget {
  const BuildWelcomeNote({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //
        Padding(
          padding: EdgeInsets.only(
            top: 50,
            bottom: 15,
          ),
          child: TextWidget('Hi, 👋 Welcome'),
        ),
        TextWidget(
          'Customize your own pack\n\n  accross 160 countries,',
          maxLines: 4,
        ),
      ],
    );
  }
}
