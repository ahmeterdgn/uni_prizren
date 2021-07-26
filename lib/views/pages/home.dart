import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_prizren/core/constants/global.dart';
import 'package:uni_prizren/core/functions/connection_server.dart';
import 'package:uni_prizren/views/pages/detail.dart';
import 'package:uni_prizren/views/widgets/newsItem.dart';
import 'package:uni_prizren/views/widgets/serverError.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var result;
  @override
  void initState() {
    super.initState();
    data();
  }

  data() async {
    result = await connectionServer({
      'action': 'newslist',
    });
    setState(() {
      print(result);
    });
  }

  bodyView() {
    Widget body = Center(
      child: CircularProgressIndicator(),
    );
    if (result != null) {
      if (result['error'] != 'server') {
        body = ListView.builder(
            itemCount: result['items'].length,
            itemBuilder: (context, index) {
              return NewsItem(
                result: result,
                index: index,
              );
            });
      } else if (result['error'] == 'time') {
        body = Center(
          child: Text("time error"),
        );
      } else {
        body = ServerError();
      }
    }
    return body;
  }

  void handleClick(String value) {
    switch (value) {
      case 'Tema Değiştir':
        print(theme);
        if (theme) {
          setState(() {
            Get.changeTheme(ThemeData(
              primaryColor: Colors.amber,
            ));
            theme = false;
          });
        } else {
          setState(() {
            Get.changeTheme(ThemeData.dark());
            theme = true;
          });
        }
        break;
      case 'Hakkında':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UKSHIN HOTI ~ Prizren'),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Tema Değiştir', 'Hakkında'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: bodyView(),
    );
  }
}
