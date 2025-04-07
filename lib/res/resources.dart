import 'package:flutter/material.dart';
import 'package:matchingsport/providers/theme.provider.dart';
import 'package:matchingsport/res/colors/app.colors.dart';
import 'package:matchingsport/res/colors/base.colors.dart';
import 'package:matchingsport/res/colors/dart.colors.dart';
import 'package:matchingsport/res/constants/app.constant.dart';
import 'package:matchingsport/res/dimensions/app.dimensions.dart';
import 'package:matchingsport/res/dimensions/base.dimensions.dart';
import 'package:matchingsport/res/icons/app.icon.dart';
import 'package:matchingsport/res/icons/base.icon.dart';
import 'package:matchingsport/res/images/app.image.dart';
import 'package:matchingsport/res/images/base.image.dart';
import 'package:matchingsport/res/sizes/app.sizes.dart';
import 'package:matchingsport/res/sizes/base.sizes.dart';
import 'package:provider/provider.dart';

class Resources {
  final BuildContext context;
  Resources(this.context);
  BaseColors get colors =>
      Provider.of<ThemeProvider>(context).mode == ThemeMode.dark
          ? DartColors()
          : AppColors();
  BaseDimensions get dimensions => AppDimensions();
  BaseIcon get icons => AppIcon();
  BaseImage get images => AppImage();
  BaseSizes get sizes => AppSizes();
  Constant get constant => Constant();

  ThemeProvider get themeProvider =>
      Provider.of<ThemeProvider>(context, listen: false);

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
