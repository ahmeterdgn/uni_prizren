// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni/core/global/constants.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.image,
    required this.text,
    required this.sizex,
    required this.color1,
    required this.color2,
    required this.onPressed,
  }) : super(key: key);

  final String image;
  final String text;
  final double sizex;
  final Color color1;
  final Color color2;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
        ),
      ),
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(4),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              pathImage + image,
              width: size.width * sizex,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              text.tr,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
