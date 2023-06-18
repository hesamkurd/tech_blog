import 'package:flutter/material.dart';
import '../app_layout.dart';
import '../my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      indent: AppLayout.getScreenWidth() / 6,
      endIndent: AppLayout.getScreenWidth() / 6,
    );
  }
}
