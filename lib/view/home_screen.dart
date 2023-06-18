import 'package:flutter/material.dart';
import 'package:tech_blog/models/fake_data.dart';

import '../app_layout.dart';
import '../gen/assets.gen.dart';
import '../my_colors.dart';
import '../my_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.textTheme,
    required this.bodyMargin,
  });

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
            HottestBlogList(bodyMargin: bodyMargin, textTheme: textTheme),
            // text hottest podcast
            HottestText(
              bodyMargin: bodyMargin,
              textTheme: textTheme,
              imageIcon: ImageIcon(Assets.icons.microphon.provider()),
              text: MyStrings.viewHottestPodCasts,
            ),
            // podcast list
            HottestPodcastList(bodyMargin: bodyMargin, textTheme: textTheme),
            SizedBox(
              height: AppLayout.getHeight(72),
            )
          ],
        ),
      ),
    );
  }
}

class HottestPodcastList extends StatelessWidget {
  const HottestPodcastList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppLayout.getScreenHeight() / 4.1,
      child: ListView.builder(
        itemCount: blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == blogList.length - 1 ? bodyMargin : 0,
              16,
              index == 0 ? bodyMargin : 16,
              8,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: AppLayout.getScreenWidth() / 3.2,
                      height: AppLayout.getScreenHeight() / 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(blogList[index].imageUrl),
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
                            blogList[index].writer,
                            style: textTheme.titleSmall,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  blogList[index].views,
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
                    ),
                  ],
                ),
                SizedBox(
                  height: AppLayout.getHeight(16),
                ),
                SizedBox(
                  // height: AppLayout.getScreenHeight() / 7,
                  width: AppLayout.getScreenWidth() / 3.2,
                  child: Text(
                    blogList[index].title,
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
    );
  }
}

class HottestBlogList extends StatelessWidget {
  const HottestBlogList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppLayout.getScreenHeight() / 4.1,
      child: ListView.builder(
        itemCount: blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == blogList.length - 1 ? bodyMargin : 0,
              16,
              index == 0 ? bodyMargin : 16,
              8,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: AppLayout.getScreenHeight() / 7,
                      width: AppLayout.getScreenWidth() / 3.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(blogList[index].imageUrl),
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
                            blogList[index].writer,
                            style: textTheme.titleSmall,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  blogList[index].views,
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
                  width: AppLayout.getScreenWidth() / 3.2,
                  child: Text(
                    blogList[index].title,
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
    );
  }
}

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
              child: Container(
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
                  )),
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
