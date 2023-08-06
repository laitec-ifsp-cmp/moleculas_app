import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppAccessProvider {
  static const String APP_ACCESS_COUNT_KEY = "APP_ACCESS_COUNT_KEY";

  Future<int> getAppAccessCount(BuildContext context) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt(APP_ACCESS_COUNT_KEY) ?? 0;
  }

  Future<void> incrementAppAccessCount(BuildContext context, counter) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt(APP_ACCESS_COUNT_KEY, counter + 1);
  }
}