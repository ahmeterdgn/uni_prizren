import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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

  data() async {
    result = await connectionServer({
      'action': 'detail',
      'url': widget.link,
    });
    setState(() {
      print("Tamamdır");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: result != null
          ? SingleChildScrollView(
              child: Html(
                data: result['data'],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
