// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:uni/core/global/constants.dart';

class OfflineScreen extends StatefulWidget {
  final body;

  const OfflineScreen({Key? key, this.body}) : super(key: key);

  @override
  _OfflineScreenState createState() => _OfflineScreenState();
}

class _OfflineScreenState extends State<OfflineScreen> {
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        if (connectivity == ConnectivityResult.none) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      pathImage + 'offline.gif',
                      width: 250,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "INTERNET BAĞLANTISINI KONTROL EDINIZ !!!",
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return child;
        }
      },
      builder: (BuildContext context) {
        return widget.body;
      },
    );
  }
}
