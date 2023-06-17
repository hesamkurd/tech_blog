import 'package:flutter/material.dart';
import 'package:tech_blog/app_layout.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_strings.dart';

import 'models/fake_data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = AppLayout.getScreenWidth() / 13;
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
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(top: AppLayout.getHeight(16)),
                child: Column(
                  children: [
                    // Main Poster
                    SizedBox(
                      width: AppLayout.getScreenWidth() / 1.19,
                      height: AppLayout.getScreenHeight() / 4.2,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: homePagePosterMap["imageAsset"], fit: BoxFit.cover),
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
                                      homePagePosterMap["writer"] +
                                          " _ " +
                                          homePagePosterMap["date"],
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
                    ),
                    // tag list
                    Container(
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
                                  index == tagList.length - 1 ? bodyMargin : 0,
                                  8,
                                  index == 0 ? bodyMargin : 16,
                                  8),
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
                    ),
                    // see hottest blog text
                    Padding(
                      padding: EdgeInsets.only(
                        right: AppLayout.getWidth(bodyMargin),
                      ),
                      child: Row(
                        children: [
                          ImageIcon(
                            Assets.icons.bluePen.provider(),
                            color: SolidColors.seeMore,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: AppLayout.getWidth(16)),
                            child: Text(
                              MyStrings.viewHottestBlog,
                              style: textTheme.headlineMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // blog list
                    SizedBox(
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
                    ),
                    // text hottest podcast
                    Padding(
                      padding: EdgeInsets.only(
                        right: AppLayout.getWidth(bodyMargin),
                        top: AppLayout.getHeight(32),
                      ),
                      child: Row(
                        children: [
                          ImageIcon(
                            Assets.icons.microphon.provider(),
                            color: SolidColors.seeMore,
                          ),
                          SizedBox(
                            width: AppLayout.getWidth(16),
                          ),
                          Text(
                            MyStrings.viewHottestPodCasts,
                            style: textTheme.headlineMedium,
                          )
                        ],
                      ),
                    ),
                    // podcast list
                    SizedBox(
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
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
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
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(16)),
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
                          onPressed: () {},
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
                          onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
