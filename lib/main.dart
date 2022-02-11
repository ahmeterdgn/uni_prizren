// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:uni/core/global/constants.dart';
import 'package:uni/views/screens/home.dart';
import 'package:uni/views/screens/offline.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  appStart() async {
    OneSignal.shared.setAppId(
      "673f3b78-5ee7-422b-8d74-35287fef2053",
    );
    // SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    appStart();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'UPZ ~ University of Prizren',
      home: SplashScreenView(
        backgroundColor: theme ? Colors.grey[900] : Colors.white,
        duration: 4000,
        imageSrc: pathImage + 'logo.png',
        text: "Powered By Ahmet Erdoğan",
        navigateRoute: OfflineScreen(body: HomeScreen()),
      ),
    );
  }
}
