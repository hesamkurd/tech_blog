import 'package:flutter/material.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/models/fake_data.dart';
import '../components/app_layout.dart';
import '../components/my_components.dart';
import '../gen/assets.gen.dart';
import '../components/my_colors.dart';
import '../components/my_strings.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.textTheme,
    required this.bodyMargin,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top: AppLayout.getHeight(16)),
        child: Column(
          children: [
            // Main Poster
            PosterHomePage(textTheme: textTheme),
            // tag list
            TagListHomePage(bodyMargin: bodyMargin, textTheme: textTheme),
            // see hottest blog text
            HottestText(
              bodyMargin: bodyMargin,
              textTheme: textTheme,
              imageIcon: ImageIcon(Assets.icons.bluePen.provider()),
              text: MyStrings.viewHottestBlog,
            ),
            // blog list
            topVisited(),
            // text hottest podcast
            HottestText(
              bodyMargin: bodyMargin,
              textTheme: textTheme,
              imageIcon: ImageIcon(Assets.icons.microphon.provider()),
              text: MyStrings.viewHottestPodCasts,
            ),
            // podcast list
            topPodcasts(),
            SizedBox(
              height: AppLayout.getHeight(72),
            )
          ],
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: AppLayout.getScreenHeight() / 3,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                index == homeScreenController.topVisitedList.length - 1 ? bodyMargin : 0,
                16,
                index == 0 ? bodyMargin : 16,
                8,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: AppLayout.getScreenHeight() / 5,
                        width: AppLayout.getScreenWidth() / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(homeScreenController.topVisitedList[index].image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const LinearGradient(
                            colors: GradientColors.blogPost,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        left: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              homeScreenController.topVisitedList[index].author!,
                              style: textTheme.titleSmall,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    homeScreenController.topVisitedList[index].view!,
                                    style: textTheme.titleSmall,
                                  ),
                                ),
                                SizedBox(
                                  width: AppLayout.getWidth(8),
                                ),
                                const Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: SolidColors.posterSubTitle,
                                  size: 20,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(16),
                  ),
                  SizedBox(
                    // height: AppLayout.getScreenHeight() / 7,
                    width: AppLayout.getScreenWidth() / 2,
                    child: Text(
                      homeScreenController.topVisitedList[index].title!,
                      maxLines: 2,
                      style: textTheme.headlineSmall,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget topPodcasts() {
    return SizedBox(
      height: AppLayout.getScreenHeight() / 3,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topPodcastsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                index == homeScreenController.topPodcastsList.length - 1 ? bodyMargin : 0,
                16,
                index == 0 ? bodyMargin : 16,
                8,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: AppLayout.getScreenWidth() / 2,
                        height: AppLayout.getScreenHeight() / 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image:
                                NetworkImage(homeScreenController.topPodcastsList[index].poster!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const LinearGradient(
                            colors: GradientColors.blogPost,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(16),
                  ),
                  SizedBox(
                    // height: AppLayout.getScreenHeight() / 7,
                    width: AppLayout.getScreenWidth() / 2,
                    child: Text(
                      homeScreenController.topPodcastsList[index].title!,
                      maxLines: 1,
                      style: textTheme.headlineSmall,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class HottestText extends StatelessWidget {
  HottestText({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
    required this.imageIcon,
    required this.text,
  });

  final double bodyMargin;
  final TextTheme textTheme;
  ImageIcon imageIcon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: AppLayout.getWidth(bodyMargin),
      ),
      child: Row(
        children: [
          ImageIcon(
            imageIcon.image,
            color: SolidColors.seeMore,
          ),
          Padding(
            padding: EdgeInsets.only(right: AppLayout.getWidth(16)),
            child: Text(
              text,
              style: textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class TagListHomePage extends StatelessWidget {
  const TagListHomePage({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: AppLayout.getHeight(16),
        bottom: AppLayout.getHeight(32),
      ),
      height: AppLayout.getHeight(60),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  index == tagList.length - 1 ? bodyMargin : 0, 8, index == 0 ? bodyMargin : 16, 8),
              child: MainTags(
                textTheme: textTheme,
                index: index,
              ),
            );
          })),
    );
  }
}

class PosterHomePage extends StatelessWidget {
  const PosterHomePage({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppLayout.getScreenWidth() / 1.19,
      height: AppLayout.getScreenHeight() / 4.2,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: homePagePosterMap["imageAsset"], fit: BoxFit.cover),
            ),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: GradientColors.homePosterCoverGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      homePagePosterMap["writer"] + " _ " + homePagePosterMap["date"],
                      style: textTheme.titleMedium,
                    ),
                    Text(
                      homePagePosterMap["view"] + "  بازدید",
                      style: textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppLayout.getHeight(8),
                ),
                Text(
                  homePagePosterMap["title"],
                  style: textTheme.displayLarge,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
