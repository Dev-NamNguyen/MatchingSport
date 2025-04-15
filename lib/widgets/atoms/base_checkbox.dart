import 'package:flutter/material.dart';
import 'package:matchingsport/res/app.context.extension.dart';
import 'package:matchingsport/res/resources.dart';

class BaseCheckBox extends StatefulWidget {
  final bool value;
  final bool isActive;
  final Function(bool?)? onChanged;

  const BaseCheckBox(
      {super.key, this.isActive = false, this.onChanged, this.value = false});

  @override
  State<BaseCheckBox> createState() => _BaseCheckBoxState();
}

class _BaseCheckBoxState extends State<BaseCheckBox> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;
    return Checkbox(
      value: isActive,
      onChanged: (bool? value) {
        setState(() {
          isActive = value!;
        });
        widget.onChanged!(value);
      },
      activeColor: resources.colors.primary,
      side: BorderSide(
        color: resources.colors.normalOutlineInput,
        width: 1.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
