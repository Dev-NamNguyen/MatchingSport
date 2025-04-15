import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {
  final String imageAssetPath;

  const SocialIcon({super.key, required this.imageAssetPath});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconWidth = screenWidth * 0.06;
    final iconHeight = screenWidth * 0.06;
    return SvgPicture.asset(
      imageAssetPath,
      width: iconWidth,
      height: iconHeight,
    );
  }
}
