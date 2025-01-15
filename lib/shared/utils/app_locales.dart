import 'package:flutter/material.dart';

class AppLocales {
  static const supportedLocales = [
    Locale('pt', 'BR'), // Portuguese - Brazil
    Locale('es', 'ES'), // Spanish - Spain
    Locale('en', 'US'), // English - United States

    // Locale('ja', 'JA'), // Japanese - Japan
    // Locale('it', 'IT'), // Italian - Italy
    // Locale('zh', 'CN'), // Chinese - China
    // Locale('fi', 'FI'), // Finnish - Finland
    // Locale('fr', 'FR'), // French - France
    // Locale('de', 'DE'), // German - Germany
    // Locale('tr', 'TR'), // Turkish - Turkey
    // Locale('ru', 'RU'), // Russian - Russia
  ];

  static const List<String> supportedLocalesFlags = [
    "", // Default language
    "assets/images/flag-brazil.svg", // Portuguese
    "assets/images/flag-spain.svg", // Spanish
    "assets/images/flag-usa.svg", // English

    // "assets/flag-japan.svg", // Japanese
    // "assets/flag-italy.svg", // Italian
    // "assets/flag-china.svg", // Chinese
    // "assets/flag-finland.svg", // Finnish
    // "assets/flag-france.svg", // French
    // "assets/flag-germany.svg", // German
    // "assets/flag-turkey.svg", // Turkish
    // "assets/flag-russia.svg", // Russian
  ];

  static const List<String> supportedLocalesLanguage = [
    "Português", // Portuguese
    "Español", // Spanish
    "English", // English

    // "日本", // Japanese
    // "Italiano", // Italian
    // "中国人", // Chinese
    // "Suomalainen", // Finnish
    // "Français", // French
    // "Deutsch", // German
    // "Türkçe", // Turkish
    // "Русский", // Russian
  ];

  static List<String> get stringOfLocales {
    List<String> completeList = ["default_language"];
    completeList.addAll(supportedLocalesLanguage);
    return completeList;
  }
}
