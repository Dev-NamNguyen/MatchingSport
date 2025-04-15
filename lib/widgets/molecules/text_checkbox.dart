import 'package:flutter/material.dart';
import 'package:matchingsport/res/app.context.extension.dart';
import 'package:matchingsport/res/resources.dart';
import 'package:matchingsport/widgets/atoms/base_checkbox.dart';

class TextCheckBox extends StatelessWidget {
  final bool value;
  final String text;
  final Function(bool?)? onChanged;

  const TextCheckBox(
      {super.key,
      required this.text,
      required this.onChanged,
      required this.value});

  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;

    return Row(
      children: [
        BaseCheckBox(
          isActive: false,
          value: value,
          onChanged: onChanged,
        ),
        Text(
          text,
          style: TextStyle(
              color: resources.colors.primaryText,
              fontSize: resources.sizes.textNormal,
              fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
