import 'package:flutter/material.dart';
import '../app_layout.dart';
import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
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

class MainTags extends StatelessWidget {
  MainTags({
    super.key,
    required this.textTheme,
    required this.index,
  });

  final TextTheme textTheme;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: GradientColors.tags,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(16),
        ),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtagicon.provider(),
              color: SolidColors.posterSubTitle,
              size: 16,
            ),
            SizedBox(
              width: AppLayout.getWidth(12),
            ),
            Text(
              tagList[index].title,
              style: textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
