import 'package:flutter/material.dart';
import 'package:tech_blog/app_layout.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_strings.dart';

import '../components/my_components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.textTheme,
    required this.bodyMargin,
  });

  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: Assets.images.profileAvatar.provider(),
          height: AppLayout.getHeight(100),
        ),
        SizedBox(
          height: AppLayout.getHeight(16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              Assets.icons.bluePen.provider(),
              color: SolidColors.seeMore,
            ),
            SizedBox(
              width: AppLayout.getWidth(8),
            ),
            Text(
              MyStrings.imageProfileEdit,
              style: textTheme.headlineMedium,
            )
          ],
        ),
        SizedBox(
          height: AppLayout.getHeight(56),
        ),
        Text(
          'حسام بابایی',
          style: textTheme.displayMedium,
        ),
        Text(
          'mamhesam1@gmail.com',
          style: textTheme.displayMedium,
        ),
        SizedBox(
          height: AppLayout.getHeight(40),
        ),
        const TechDivider(),
        InkWell(
          onTap: () {
            // TODO
          },
          splashColor: SolidColors.primaryColor,
          child: SizedBox(
            height: AppLayout.getHeight(42),
            child: Center(
              child: Text(
                MyStrings.myFavBlog,
                style: textTheme.displayMedium,
              ),
            ),
          ),
        ),
        const TechDivider(),
        InkWell(
          onTap: () {
            // TODO
          },
          splashColor: SolidColors.primaryColor,
          child: SizedBox(
            height: AppLayout.getHeight(42),
            child: Center(
              child: Text(
                MyStrings.myFavPodcast,
                style: textTheme.displayMedium,
              ),
            ),
          ),
        ),
        const TechDivider(),
        InkWell(
          onTap: () {
            // TODO
          },
          splashColor: SolidColors.primaryColor,
          child: SizedBox(
            height: AppLayout.getHeight(42),
            child: Center(
              child: Text(
                MyStrings.logOut,
                style: textTheme.displayMedium,
              ),
            ),
          ),
        ),
        SizedBox(
          height: AppLayout.getHeight(80),
        ),
      ],
    );
  }
}
