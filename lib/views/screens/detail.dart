import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:translated_text/translated_text.dart';
import 'package:uni/core/global/constants.dart';
import 'package:uni/core/global/funciton.dart';

class DetailScreen extends StatefulWidget {
  final link;
  final title;
  const DetailScreen({Key? key, this.link, this.title}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var data;
  @override
  void initState() {
    super.initState();
    getDetail();
  }

  getDetail() async {
    data = await connectionServer(
      add: '/detail?link=' + widget.link,
    );
    setState(() {
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: data != null
            ? TranslatedText(
                data['data']['title'],
                to: 'tr',
                from: 'sq',
              )
            : widget.title,
        backgroundColor: mainColor,
      ),
      body: data != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image.network(data['data']['image']),
                  SizedBox(
                    height: 10,
                  ),
                  data['data']['title'] != '' || data['data']['title'] != null
                      ? TranslatedText(
                          data['data']['title'],
                          to: 'tr',
                          from: 'sq',
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  data['data']['title'] != '' || data['data']['title'] != null
                      ? TranslatedText(
                          data['data']['content'],
                          to: 'tr',
                          from: 'sq',
                        )
                      : Container(),

                  // Html(data: data['data']['content']),
                ],
              ),
            )
          : Center(
              child: Text("Loading"),
            ),
    );
  }
}
