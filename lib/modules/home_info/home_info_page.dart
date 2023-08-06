import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:moleculas_ar/modules/home_info/pages/about_us/about_us_page.dart';
import 'package:moleculas_ar/modules/home_info/pages/info/info_page.dart';
import 'package:moleculas_ar/shared/res/app_res.dart';
import 'package:moleculas_ar/shared/widgets/shared_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeInfoPage extends StatelessWidget {
  const HomeInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 24.w),
        child: Column(
          children: [
            IconTextOutlinedButtonWidget(
              imagePath: AppRes.images.iconAboutBook,
              title: "ebook".i18n(),
              onPressed: () => goToInfoPage(
                context: context,
                imagePath: AppRes.images.aboutEBook,
                title: "access_ebook".i18n(),
                summary: "access_ebook_summary".i18n(),
                onPressedButton: null,
              ),
            ),
            SizedBox(height: 20.h),
            IconTextOutlinedButtonWidget(
              imagePath: AppRes.images.iconAboutTargets,
              title: "targets".i18n(),
              onPressed: () => goToInfoPage(
                context: context,
                imagePath: AppRes.images.aboutTargets,
                title: "download_targets".i18n(),
                summary: "download_targets_summary".i18n(),
                onPressedButton: () async {
                  Uri uri = Uri.parse(
                      "https://drive.google.com/file/d/1_T4XpAO_gKZyNNw8P0ljor6jti92W4_e/view?usp=sharing");
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
              ),
            ),
            SizedBox(height: 20.h),
            IconTextOutlinedButtonWidget(
              imagePath: AppRes.images.iconAbout,
              title: "about".i18n(),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AboutUsPage()));
              },
            ),
            SizedBox(height: 20.h),
            IconTextOutlinedButtonWidget(
              imagePath: AppRes.images.iconAboutFeedback,
              title: "feedback".i18n(),
              onPressed: () => goToInfoPage(
                context: context,
                imagePath: AppRes.images.aboutFeedback,
                title: "give_feedback".i18n(),
                summary: "",
                onPressedButton: null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToInfoPage({
    required dynamic context,
    required String imagePath,
    required String title,
    required String summary,
    required VoidCallback? onPressedButton,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => InfoPage(
          imagePath: imagePath,
          title: title,
          summary: summary,
          onPressedButton: onPressedButton,
        ),
      ),
    );
  }
}
