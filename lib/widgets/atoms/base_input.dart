import 'package:flutter/material.dart';
import 'package:matchingsport/res/app.context.extension.dart';
import 'package:matchingsport/res/resources.dart';

class BaseInput extends StatefulWidget {
  final bool isObscureText;
  final Widget? suffixIcon;
  final String? hiddenText;

  const BaseInput(
      {super.key,
      this.isObscureText = false,
      this.suffixIcon,
      this.hiddenText});

  @override
  State<BaseInput> createState() => _BaseInputState();
}

class _BaseInputState extends State<BaseInput> {
  late bool isHidden;

  @override
  void initState() {
    super.initState();
    isHidden = widget.isObscureText;
  }

  void _toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;

    Widget visibleWidget() {
      if (isHidden) {
        return IconButton(
          icon: Icon(
            Icons.visibility,
            color: resources.colors.primaryText,
          ),
          onPressed: _toggleVisibility,
        );
      } else {
        return IconButton(
          icon: Icon(
            Icons.visibility_off,
            color: resources.colors.primaryText,
          ),
          onPressed: _toggleVisibility,
        );
      }
    }

    return TextField(
      cursorColor: resources.colors.cursorColor,
      obscureText: isHidden,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hiddenText,
        filled: true,
        fillColor: resources.colors.primaryBackgroundInput,
        // focusColor: resources.colors.whiteColor,
        // hoverColor: resources.colors.whiteColor,
        suffixIcon: widget.suffixIcon ??
            (widget.isObscureText ? visibleWidget() : null),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        hintStyle: TextStyle(
            color: resources.colors.primaryText, fontWeight: FontWeight.w300),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17.0),
            borderSide: BorderSide(color: resources.colors.normalOutlineInput),
            gapPadding: 10),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17.0),
            borderSide: BorderSide(
                color: resources.colors.normalOutlineInput, strokeAlign: 2),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17.0),
            borderSide: BorderSide(color: resources.colors.primary, width: 2.0),
            gapPadding: 10),
      ),
    );
  }
}
