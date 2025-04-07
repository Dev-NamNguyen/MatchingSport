import 'package:flutter/material.dart';

class VisibleWidget extends StatelessWidget {
  final bool isHidden;
  final Function toggleVisibility;

  const VisibleWidget(
      {super.key, this.isHidden = false, required this.toggleVisibility});

  @override
  Widget build(BuildContext context) {
    if (isHidden) {
      return IconButton(
        icon: const Icon(Icons.visibility),
        onPressed: toggleVisibility(),
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.visibility_off),
        onPressed: toggleVisibility(),
      );
    }
  }
}
