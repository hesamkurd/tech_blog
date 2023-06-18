import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/app_layout.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_strings.dart';
import 'package:tech_blog/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.tcbot,
                height: AppLayout.getHeight(100),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppLayout.getHeight(16),
                  bottom: AppLayout.getHeight(32),
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyStrings.welcom,
                    style: textTheme.displayMedium,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showBottomSheetEmail(context, textTheme);
                },
                child: Text(MyStrings.letsGo),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showBottomSheetEmail(BuildContext context, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: AppLayout.getScreenHeight() / 3,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  MyStrings.insertYourEmail,
                  style: textTheme.displayMedium,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    onChanged: (value) {
                      print('${value}is email: ${isEmail(value)}');
                    },
                    style: textTheme.displayMedium,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "techBlog@gmail.com",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _activateCodeBottomSheet(context, textTheme);
                  },
                  child: Text(MyStrings.continuation),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _activateCodeBottomSheet(BuildContext context, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: AppLayout.getScreenHeight() / 3,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  MyStrings.activateCode,
                  style: textTheme.displayMedium,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    onChanged: (value) {
                      print('${value}is email: ${isEmail(value)}');
                    },
                    style: textTheme.displayMedium,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "******",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MyCats(),
                      ),
                    );
                  },
                  child: Text(MyStrings.continuation),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
