import 'package:flutter/material.dart';
import 'package:tech_blog/app_layout.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: AppLayout.getHeight(16)),
          // Top App bar
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.menu,
                    size: 32,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: AppLayout.getWidth(64)),
                      child: Assets.images.a1
                          .image(height: AppLayout.getScreenHeight() / 14)),
                  const Icon(
                    Icons.search,
                    size: 32,
                  ),
                ],
              ),
              SizedBox(
                height: AppLayout.getHeight(16),
              ),
              Stack(
                children: [
                  Container(
                    width: AppLayout.getScreenWidth() / 1.19,
                    height: AppLayout.getScreenHeight() / 4.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: Assets.images.posterTest.provider(),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    width: AppLayout.getScreenWidth() / 1.19,
                    height: AppLayout.getScreenHeight() / 4.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                          colors: GradientColors.homePosterCoverGradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
