import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moleculas_ar/shared/utils/app_locales.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocaleProvider {
  static const String APP_LOCALE = "APP_LOCALE";

  int localeIndex = 0;

  Locale? get locale =>
      localeIndex <= 0 ? null : AppLocales.supportedLocales[localeIndex - 1];

  AppLocaleProvider(BuildContext context) {
    _loadLocale(context);
  }

  Future<void> _loadLocale(BuildContext context) async {
    localeIndex = getAppLocale(context) as int;
  }

  Future<int> getAppLocale(BuildContext context) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt(APP_LOCALE) ?? -1;
  }

  Future<void> setAppLocale(BuildContext context, int localeIndex) async {
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

  void localesOnChanged(BuildContext context, String? value) {
    if (value == null) return;
    final newIndex = AppLocales.stringOfLocales.indexOf(value);
    if (localeIndex != newIndex) {
      localeIndex = newIndex;
      setAppLocale(context, localeIndex);
    }
  }

  String? localesValue() {
    return AppLocales.stringOfLocales[max(localeIndex, 0)];
  }
}
