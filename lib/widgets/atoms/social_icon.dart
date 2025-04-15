import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {
  final String imageAssetPath;

  const SocialIcon({super.key, required this.imageAssetPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imageAssetPath,
      width: 24,
      height: 24,
    );
  }
}
