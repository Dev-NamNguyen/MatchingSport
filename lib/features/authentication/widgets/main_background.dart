import 'package:flutter/material.dart';
import 'package:matchingsport/res/app.context.extension.dart';
import 'package:matchingsport/res/colors/base.colors.dart';

class MainBackground extends StatelessWidget {
  final Widget child;

  const MainBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    BaseColors colors = context.resources.colors;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [colors.primary, colors.secondary])),
        child: child,
      ),
    );
  }
}
