// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:uni_prizren/core/constants/global.dart';
import 'package:uni_prizren/views/pages/detail.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:translated_text/translated_text.dart';

class NewsItem extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final result;
  // ignore: prefer_typing_uninitialized_variables
  final index;
  const NewsItem({Key? key, this.result, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              link: result['items'][index]['link'],
              title: result['items'][index]['title'],
            ),
          ),
        );
      },
      splashColor: Colors.deepPurple,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: theme ? Colors.grey[900] : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: TranslatedText(
              result['items'][index]["title"] ?? '',
              to: 'tr',
              from: 'sq',
            ),
            // subtitle: TranslatedText(
            //   result['items'][index]["desc"] ?? '',
            //   to: 'tr',
            //   from: 'sq',
            // ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
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
