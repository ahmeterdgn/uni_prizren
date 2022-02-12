// ignore_for_file: prefer_typing_uninitialized_variables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni/core/global/constants.dart';
import 'package:uni/views/screens/detail.dart';
import 'package:uni/views/screens/pdf.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:translated_text/translated_text.dart';

class ListItem extends StatelessWidget {
  final color;
  final title;
  final time;
  final link;
  final type;
  const ListItem(
      {Key? key, this.color, this.title, this.time, this.link, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      onTap: () {
        if (type == 'news') {
          Get.to(
            DetailScreen(
              link: link,
              title: title,
            ),
          );
        } else {
          Get.to(
            PdfScreen(
              link: link,
              title: title,
            ),
          );
        }
      },
      splashColor: color,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: theme ? Colors.grey[900] : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            // title: TranslatedText(
            //   result['items'][index]["title"] ?? '',
            //   to: 'tr',
            //   from: 'sq',
            // ),
            subtitle: Text(time),
            title: title,
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (type == 'news') {
                      Get.to(
                        DetailScreen(
                          link: link,
                          title: title,
                        ),
                      );
                    } else {
                      Get.to(
                        PdfScreen(
                          link: link,
                          title: title,
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
