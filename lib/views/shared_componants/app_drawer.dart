import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netcoin_v_1/controllers/theme_mood_controller.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeMoodController themeController = Get.find<ThemeMoodController>();
    return Container(
      child: ListView(
        children: [
          DrawerHeader(child: Container()),
          ListTile(),
          GetBuilder<ThemeMoodController>(
              builder: (_) => SwitchListTile(
                    value: themeController.isDarkMode,
                    onChanged: (value) {
                      themeController.updateTheme(value);
                    },
                    title: Text(themeController.isDarkMode
                        ? 'Light Theme'
                        : 'Dark Theme'),
                  ))
        ],
      ),
    );
  }
}
