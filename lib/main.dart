import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:netcoin_v_1/views/screens/authintcation_screens/login_screen/login_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'controllers/authintcation_controller.dart';
import 'controllers/theme_mood_controller.dart';
import 'data/settings/app_theme.dart';

Future<void> main() async {
  //Remove this method to stop OneSignal Debugging
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("170b11e5-8c10-477a-9f58-b92332ffb1df");
  String? id;
  var s = OneSignal.shared.getDeviceState().then((value) {
    value?.userId;
    AuthenticationController.onsignalID = value?.userId;
    print('-----------------user id ----------------');
    print(AuthenticationController.onsignalID);
  });

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
  /*OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
    // Will be called whenever a notification is received in foreground
    // Display Notification, pass null param for not displaying the notification
    event.complete(event.notification);
  });

  OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    // Will be called whenever a notification is opened/button pressed.
  });

  OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
    // Will be called whenever the permission changes
    // (ie. user taps Allow on the permission prompt in iOS)
  });

  OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
    // Will be called whenever the subscription changes
    // (ie. user gets registered with OneSignal and gets a user ID)
  });

  OneSignal.shared.setEmailSubscriptionObserver((OSEmailSubscriptionStateChanges emailChanges) {
    // Will be called whenever then user's email subscription changes
    // (ie. OneSignal.setEmail(email) is called and the user gets registered
  });*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  ThemeMoodController themeController = Get.put(ThemeMoodController());
  static const platform = MethodChannel("samples.netcoin.dev/Encryption");

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeMoodController>(
        init: themeController,
        builder: (_) => ScreenUtilInit(
            designSize: const Size(360, 640),
            builder: () {
              return GetMaterialApp(
                  textDirection: TextDirection.rtl,
                  title: 'NetCoin',
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: themeController.isDarkMode
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  home: const HomePage());
            }));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationController auth = Get.put(AuthenticationController());
    auth.getFromShared();

    return GetBuilder<AuthenticationController>(
      init: AuthenticationController(),
      builder: (_) => Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
