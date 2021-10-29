import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:translated_text/translated_text.dart';
import 'package:uni_prizren/core/functions/connection_server.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title;
  // ignore: prefer_typing_uninitialized_variables
  final link;

  // ignore: use_key_in_widget_constructors
  const DetailPage({this.title, this.link});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // ignore: prefer_typing_uninitialized_variables
  var result;
  @override
  void initState() {
    super.initState();
    data();
  }

  // ignore: prefer_typing_uninitialized_variables
  var datas;
  data() async {
    result = await connectionServer({
      'action': 'detail',
      'url': widget.link,
    });
    setState(() {});
  }

  void handleClick(String value) {
    switch (value) {
      case 'Tarayıcıda Aç':
        launchURL(url: widget.link);
        break;
      case 'Paylaş':
        Share.share('Üniversite Yeni Haber Yayınladı !!! ${widget.link}',
            subject: 'Hemen Paylaş');

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TranslatedText(
          widget.title,
          to: 'tr',
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Tarayıcıda Aç', 'Paylaş'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: result != null
          ? Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TranslatedText(
                    result['data'],
                    to: 'tr',
                    from: 'sq',
                  ),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  launchURL({url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
