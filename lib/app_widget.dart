import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:moleculas_ar/shared/providers/app_locale_provider.dart';
import 'package:moleculas_ar/shared/theme/app_theme.dart';
import 'package:moleculas_ar/shared/utils/app_locales.dart';
import 'package:provider/provider.dart';

import 'modules/home_navigation/home_navigation_page.dart';
import 'modules/molecule_ar/molecule_ar_page.dart';
import 'modules/on_boarding/on_boarding_page.dart';
import 'modules/splash/splash_page.dart';
import 'shared/res/app_res.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['assets/i18n'];

    return ScreenUtilInit(
      designSize: const Size(432, 936),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return ListenableProvider<AppLocaleProvider>(
          create: (_) => AppLocaleProvider(context),
          child: Consumer<AppLocaleProvider>(builder: (_, provider, __) {
            return MaterialApp(
              title: "Moléculas AR",
              theme: ThemeData(
                primaryColor: AppTheme.colors.background,
                scaffoldBackgroundColor: AppTheme.colors.background,
              ),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                // delegate from flutter_localization
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                // delegate from localization package.
                LocalJsonLocalization.delegate,
              ],
              locale: provider.locale,
              localeListResolutionCallback:
                  provider.localeListResolutionCallback,
              supportedLocales: AppLocales.supportedLocales,
              home: child,
              routes: {
                "/splash": (context) => const SplashPage(),
                "/on_boarding": (context) => const OnBoardingPage(),
                "/home_navigation": (context) => const HomeNavigationPage(),
                "/ar_molecule_target": (context) => const MoleculeArPage(),
              },
            );
          }),
        );
      },
      child: const SplashPage(),
    );
  }
}
