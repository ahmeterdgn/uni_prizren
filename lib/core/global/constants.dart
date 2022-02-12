// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni/views/screens/list.dart';
import 'package:uni/views/screens/settings.dart';

bool theme = false;
String pathImage = 'assets/images/';
Color mainColor = const Color(0xffcb9727);
var result;
List menu = [
  {
    'title': 'Haberler',
    'image': 'news.png',
    'color1': const Color(0xFF7D5FB3),
    'color2': const Color(0xFF7D5FB3),
    'onPressed': () {
      Get.to(
        ListScreen(
          title: "Haberler",
          type: 'news',
          color: Color(0xFF7D5FB3),
        ),
      );
    }
  },
  {
    'title': 'Ders Programları',
    'image': 'syllabus.png',
    'color1': const Color(0xFFAB5080),
    'color2': const Color(0xFFAB5080),
    'onPressed': () {
      Get.to(
        ListScreen(
          title: "Ders Programları",
          type: 'syllabus',
          color: Color(0xFFAB5080),
        ),
      );
    }
  },
  {
    'title': 'Sınavlar',
    'image': 'exam.png',
    'color1': const Color(0xFF5772BA),
    'color2': const Color(0xFF5772BA),
    'onPressed': () {
      Get.to(
        ListScreen(
          title: "Sınavlar",
          type: 'exam',
          color: Color(0xFF5772BA),
        ),
      );
    }
  },
  {
    'title': 'Ayarlar',
    'image': 'settings.png',
    'color1': const Color(0xFF5C5A5A),
    'color2': const Color(0xFF5C5A5A),
    'onPressed': () {
      Get.to(SettingsScreen());
    }
  },
];
