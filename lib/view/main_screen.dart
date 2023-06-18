import 'package:flutter/material.dart';
import 'package:tech_blog/app_layout.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = AppLayout.getScreenWidth() / 13;

    List<Widget> pagesMainScreen = [
      HomeScreen(textTheme: textTheme, bodyMargin: bodyMargin),
      ProfileScreen(textTheme: textTheme, bodyMargin: bodyMargin),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: SolidColors.scaffoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.menu,
                size: 32,
                color: Colors.black,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(64)),
                  child: Assets.images.a1.image(height: AppLayout.getScreenHeight() / 14)),
              const Icon(
                Icons.search,
                size: 32,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: pagesMainScreen[selectedPageIndex],
            ),
            BottomNavigation(
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: AppLayout.getScreenHeight() / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: GradientColors.bottomNavBackground,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: AppLayout.getWidth(bodyMargin),
            right: AppLayout.getWidth(bodyMargin),
            bottom: AppLayout.getWidth(8),
          ),
          child: Container(
            height: AppLayout.getScreenHeight() / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: GradientColors.bottomNav,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => changeScreen(0),
                  icon: ImageIcon(
                    Assets.icons.home.provider(),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    Assets.icons.write.provider(),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () => changeScreen(1),
                  icon: ImageIcon(
                    Assets.icons.user.provider(),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}