import 'app_images/app_images.dart';

class AppRes {
  static final AppRes instance = AppRes();

  final _appImages = AppImages();
  static AppImages get images => instance._appImages;
}