// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:translated_text/translated_text.dart';
import 'package:translator/translator.dart';
import 'package:uni/core/global/constants.dart';
import 'package:uni/views/widgets/list_item.dart';

class ListScreen extends StatefulWidget {
  final type;
  final color;
  final title;
  const ListScreen({Key? key, this.type, this.color, this.title})
      : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: result != null
          ? ListView.builder(
              itemCount: result[widget.type].length,
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ListItem(
                    type: widget.type,
                    time: result[widget.type][i]['time'] ?? '',
                    title: widget.type == 'news'
                        ? TranslatedText(
                            result[widget.type][i]['title'] ?? '',
                            to: 'tr',
                            from: 'sq',
                          )
                        : Text(result[widget.type][i]['title']),
                    color: widget.color,
                    link: result[widget.type][i]['link'],
                  ),
                );
              },
            )
          : Center(
              child: Text("Loading"),
            ),
    );
  }
}
