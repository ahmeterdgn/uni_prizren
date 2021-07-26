import 'package:flutter/material.dart';

class ServerError extends StatelessWidget {
  const ServerError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Sunucu ile alakalı bir sorun oluştu. \n\n ahmeterdgn6@gmail.com \n\n ile iletişime geçiniz.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
