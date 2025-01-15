import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moleculas_ar/shared/utils/app_locales.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocaleProvider extends ChangeNotifier {
  static const String APP_LOCALE = "APP_LOCALE";

  int localeIndex = 0;

  Locale? get locale =>
      localeIndex <= 0 ? null : AppLocales.supportedLocales[localeIndex - 1];

  AppLocaleProvider(BuildContext context) {
    print("AppLocaleProvider");
    print("localeIndex = $localeIndex");
    _loadLocale();
    print("localeIndex = $localeIndex");
  }

  Future<void> _loadLocale() async {
    localeIndex = await getAppLocale();
    notifyListeners();
  }

  Future<int> getAppLocale() async {
    final preferences = await SharedPreferences.getInstance();
    print("getAppLocale- localeIndex = ${preferences.getInt(APP_LOCALE)}");
    return preferences.getInt(APP_LOCALE) ?? -1;
  }

  Future<void> setAppLocale(int localeIndex) async {
    print("setAppLocale- localeIndex = $localeIndex");
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt(APP_LOCALE, localeIndex);
  }

  Locale? localeListResolutionCallback(
      List<Locale>? locales, Iterable<Locale> supportedLocales) {
    if (localeIndex >= 1) {
      return supportedLocales.elementAt(localeIndex - 1);
    }

    if (locales != null) {
      for (final locale in locales) {
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
      }
    }

    return const Locale('pt', 'BR');
  }

  void localesOnChanged(String? value) {
    if (value == null) return;
    final newIndex = AppLocales.stringOfLocales.indexOf(value);
    print("localeIndex = $localeIndex");
    if (localeIndex != newIndex) {
      localeIndex = newIndex;
      setAppLocale(localeIndex);
      notifyListeners();
      print("teste");
    }
  }

  String? currentLocaleValue() {
    print(localeIndex);
    return AppLocales.stringOfLocales[max(localeIndex, 0)];
  }
}
