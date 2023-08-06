import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moleculas_ar/shared/providers/app_access_provider.dart';
import 'package:moleculas_ar/shared/res/app_res.dart';
import 'package:moleculas_ar/shared/theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _checkAppAccessCounter() async {
    Future.delayed(const Duration(milliseconds: 1500)).then((value) async {
      AppAccessProvider appAccessProvider = AppAccessProvider();
      int counter = await appAccessProvider.getAppAccessCount(context);
      String route = "/on_boarding";
      if (counter < 3) {
        await appAccessProvider.incrementAppAccessCount(context, counter);
      } else {
        route = "/home_navigation";
      }

      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, route);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _checkAppAccessCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppRes.images.appLogo, height: 192.h, width: 192.w),
              SizedBox(height: 20.h),
              const Text("Moléculas AR").splashText,
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(AppTheme.colors.primaryLight),
              strokeWidth: 3.w,
            ),
          ),
        ),
      ]),
    );
  }
}
