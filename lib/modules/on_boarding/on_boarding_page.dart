import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:moleculas_ar/shared/res/app_res.dart';
import 'package:moleculas_ar/shared/theme/app_theme.dart';

import 'widgets/on_boarding_info/on_boarding_info_widget.dart';
import 'widgets/progress_bar/progress_bar_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  final int _numPages = 3;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/home_navigation");
            },
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.colors.primaryLight,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
            ),
            child: Text("skip".i18n().toUpperCase()).textButton,
          ),
        ],
      ),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int newPage) {
          setState(() {
            _currentPage = newPage;
          });
        },
        children: [
          OnBoardingInfoWidget(
            image: AppRes.images.onBoardingDna,
            title: "",
            summary: "on_boarding_summary_1".i18n(),
          ),
          OnBoardingInfoWidget(
            image: AppRes.images.onBoardingDna3d,
            title: "",
            summary: "on_boarding_summary_2".i18n(),
          ),
          OnBoardingInfoWidget(
            image: AppRes.images.onBoardingDnaHolo,
            title: "",
            summary: "on_boarding_summary_3".i18n(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60.h,
        margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
        alignment: Alignment.topCenter,
        child: ProgressBarWidget(
          totalPage: _numPages,
          currentPage: _currentPage,
          onNextPressed: () {
            if (_currentPage != _numPages - 1) {
              setState(() {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              });
            } else {
              Navigator.pushReplacementNamed(context, "/home_navigation");
            }
          },
          onBackPressed: () {
            setState(() {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
              );
            });
          },
        ),
      ),
    );
  }
}
