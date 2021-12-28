import 'package:get/get.dart';

class ThemeMoodController extends GetxController {
  bool isDarkMode = false;

  void updateTheme(bool isDarkMode) {
    this.isDarkMode = isDarkMode;
    update();
  }
}
