import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:uni_prizren/views/pages/home.dart';
import 'package:uni_prizren/views/pages/offline.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:get/get.dart';

import 'core/constants/global.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    onsingal();
  }

  onsingal() async {
    OneSignal.shared.setAppId(
      "673f3b78-5ee7-422b-8d74-35287fef2053",
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      theme = prefs.getBool('theme') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Prizren University",
      theme: theme
          ? ThemeData(
              primaryColor: Colors.amber,
              accentColor: Colors.white,
            )
          : ThemeData.dark(),
      home: SplashScreenView(
        backgroundColor: Colors.white,
        duration: 4000,
        imageSrc: 'assets/image/uni.png',
        text: "Powered By Ahmet Erdoğan",
        navigateRoute: Offline(body: HomePage()),
      ),
    );
  }
}
