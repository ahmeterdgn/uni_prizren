import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:uni_prizren/views/pages/home.dart';
import 'package:uni_prizren/views/pages/offline.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

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

  onsingal() {
    OneSignal.shared.init(
      "673f3b78-5ee7-422b-8d74-35287fef2053",
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: SplashScreenView(
        backgroundColor: Colors.white,
        home: Offline(body: HomePage()),
        duration: 4000,
        imageSrc: 'assets/image/uni.png',
        text: "Powered By Ahmet Erdoğan",
      ),
    );
  }
}
