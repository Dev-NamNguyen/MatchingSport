import 'package:flutter/material.dart';
import 'package:matchingsport/res/app.context.extension.dart';
import 'package:matchingsport/res/resources.dart';

class TextDivider extends StatelessWidget {
  final String text;
  final double thickness;
  final Color? color;
  final TextStyle? textStyle;

  const TextDivider({
    super.key,
    required this.text,
    this.thickness = 1.0,
    this.color,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;

    Color color = this.color ?? resources.colors.greyMiddle;
    TextStyle textStyle = this.textStyle ??
        TextStyle(
          color: color,
        );
    return Row(
      children: [
        Expanded(
          child: Container(
            height: thickness,
            color: color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: textStyle,
          ),
        ),
        Expanded(
          child: Container(
            height: thickness,
            color: color,
          ),
        ),
      ],
    );
  }
}
