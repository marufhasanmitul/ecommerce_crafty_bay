
import 'package:ecommerce_crafty_bay/presentation/ui/utils/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CraftyBayLogo extends StatelessWidget {
  const CraftyBayLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      ImageAssets.craftyBayLogoSvg,
      width: 100,
    );
  }
}