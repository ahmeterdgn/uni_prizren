import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:translate/translate.dart';
import 'package:translated_text/translated_text.dart';
import 'package:uni_prizren/core/functions/connection_server.dart';

class DetailPage extends StatefulWidget {
  final title;
  final link;

  const DetailPage({Key key, this.title, this.link}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var result;
  @override
  void initState() {
    super.initState();
    data();
  }

  var datas;
  data() async {
    result = await connectionServer({
      'action': 'detail',
      'url': widget.link,
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TranslatedText(
          widget.title,
          to: 'tr',
        ),
      ),
      body: result != null
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TranslatedText(
                  result['data'],
                  to: 'tr',
                  from: 'sq',
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
