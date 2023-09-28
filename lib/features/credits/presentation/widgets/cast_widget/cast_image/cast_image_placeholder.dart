import 'package:flutter/material.dart';
import 'package:mo3tv/core/utils/app_assets.dart';
class CastImagePlaceholder extends StatelessWidget {
  const CastImagePlaceholder({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(image: AssetImage(AppAssets.personPlaceholder),fit: BoxFit.cover),
      ),
    );
  }
}