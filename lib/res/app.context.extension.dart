import 'package:flutter/material.dart';
import 'package:matchingsport/res/resources.dart';

extension AppContextExtension on BuildContext {
  Resources get resources => Resources(this);
}
