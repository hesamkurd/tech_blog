import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/app_layout.dart';
import 'package:tech_blog/components/my_components.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/my_strings.dart';

import '../my_colors.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: AppLayout.getHeight(32)),
            child: Column(
              children: [
                SvgPicture.asset(
                  Assets.images.tcbot,
                  height: AppLayout.getHeight(100),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppLayout.getHeight(32)),
                  child: Text(
                    MyStrings.successfulRegistration,
                    style: textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(64)),
                  child: TextField(
                    style: textTheme.displayMedium,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: MyStrings.nameAndFamilyName,
                      hintStyle: textTheme.displayMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppLayout.getHeight(32),
                    bottom: AppLayout.getHeight(16),
                  ),
                  child: Text(
                    MyStrings.chooseCats,
                    style: textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: AppLayout.getHeight(100),
                    child: GridView.builder(
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedTags.add(tagList[index]);
                            });
                          },
                          child: MainTags(
                            textTheme: textTheme,
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Image.asset(
                  Assets.icons.downCatArrow.path,
                  scale: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: AppLayout.getHeight(100),
                    child: GridView.builder(
                      itemCount: selectedTags.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedTags.removeAt(index);
                            });
                          },
                          child: Container(
                            height: AppLayout.getHeight(60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: SolidColors.surface,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppLayout.getWidth(16),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.delete,
                                    color: SolidColors.errorColor,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: AppLayout.getWidth(8),
                                  ),
                                  Text(
                                    selectedTags[index].title,
                                    style: textTheme.displayMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
