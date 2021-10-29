import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class Offline extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Offline({
    this.body,
  });

  // ignore: prefer_typing_uninitialized_variables
  final body;
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
                      'assets/image/offline.gif',
                      width: 250,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Kanka Bak İnternetin Yok Ayıp Oluyor Böyle Bir Uygulamaya İnternetsiz Girmeye Çalışmak Nedir Ya Çok AYIP!",
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
        return body;
      },
    );
  }
}
